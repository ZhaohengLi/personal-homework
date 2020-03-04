import os

def getMem():
    fd = open('mem.txt')
    memory = fd.readlines()
    mainMem = []
    for i in range(0, len(memory)):
        line = memory[i].split(' ')
        #print line
        page = []
        for j in range(2, len(line)):
            if line[j] != '\n':
                page.append(int(line[j],16))
        mainMem.append(page)
        #print page
    return mainMem
    
def find():
    # from keyboard get input
    string = raw_input("input your physics address: ");
    print "Virtual Address " + string + ":"
    dev = int(string, 16)
    offset = dev & 31
    page_no = (dev>>5) & 31
    index = (dev>>10) & 31
    #get memory
    list = getMem()
    page_1 = 17;
    #step1
    page_2 = list[page_1][index]
    if(page_2 < 128):
        print "  --> pde index:" + hex(index) + "  pde contents:(valid 0, pfn " + hex(page_2) + ")"
        print "      --> Fault (page table entry not valid)"
        return
    else:
        page_2 = page_2 - 128
        print "  --> pde index:" + hex(index) + "  pde contents:(valid 1, pfn " + hex(page_2) + ")"
    #step2
    page_3 = list[page_2][page_no]
    if(page_3 < 128):
        print "    --> pte index:" + hex(page_no) + "  pte contents:(valid 0, pfn" + hex(page_3) + ")"
        print "      --> Fault (page table entry not valid)"
        return
    else:
        page_3 = page_3 - 128
        print "    --> pte index:" + hex(page_no) + "  pte contents:(valid 1, pfn" + hex(page_3) + ")"
    #step3
    data = list[page_3][offset]
    p_addr = page_3*32 + offset
    print "      -->Translates to Physical Address " + hex(p_addr) +" --> Value: " + hex(data)

    
if __name__ == "__main__":
    find()

