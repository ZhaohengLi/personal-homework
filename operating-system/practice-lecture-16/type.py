TUBE = 1
QUEUE = 2
MEM = 3


class Example:
    type = None
    process_1 = None
    process_2 = None

    def __init__(self, type):
        self.type = type
        self.process_1 = Process(1)
        self.process_2 = Process(2)

    def sim(self):
        if self.type == TUBE:
            for i in range(100000):
                self.process_2.receive_message(self.process_1.send_message())
                self.process_1.receive_message(self.process_2.send_message())
        if self.type == QUEUE:
            queue = Queue()
            queue.add_msg(self.process_1.send_message(), self.process_1.get_id(), self.process_2.get_id())
            for i in range(100000):
                msg, _ = queue.search_msg(self.process_2.get_id())
                self.process_2.receive_message(msg)
                queue.add_msg(self.process_2.send_message(), self.process_2.get_id(), self.process_1.get_id())

                msg, _ = queue.search_msg(self.process_1.get_id())
                self.process_1.receive_message(msg)
                queue.add_msg(self.process_1.send_message(), self.process_1.get_id(), self.process_2.get_id())
        if self.type == MEM:
            mem = Mem()
            mem.write(self.process_1.send_message())
            for i in range(100000):
                status, msg = mem.read()
                self.process_2.receive_message(msg)
                mem.write(self.process_2.send_message())

                status, msg = mem.read()
                self.process_1.receive_message(msg)
                mem.write(self.process_1.send_message())

        final_message = self.process_1.send_message()
        print(final_message)


class Mem:
    message = None
    in_use = False

    def write(self, message):
        self.in_use = True
        self.message = message
        self.in_use = False

    def read(self):
        if self.in_use:
            return False, None
        else:
            return True, self.message


class Queue:
    message = []
    msg_from = []
    msg_to = []

    def add_msg(self, message, msg_from, msg_to):
        self.message.append(message)
        self.msg_from.append(msg_from)
        self.msg_to.append(msg_to)

    def search_msg(self, process_id):
        res_message = None
        res_msg_from = None
        for i in range(len(self.msg_to)):
            if self.msg_to[i] == process_id:
                res_message, res_msg_from = self.message[i], self.msg_from[i]
                self.message.pop(i)
                self.msg_to.pop(i)
                self.msg_from.pop(i)
                break
        return res_message, res_msg_from


class Process:
    id = None
    msg = 0

    def __init__(self, id):
        self.id = id
        self.msg = 0

    def send_message(self):
        return self.msg

    def receive_message(self, message):
        self.msg = message + 1

    def get_id(self):
        return self.id
