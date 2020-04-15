from type import *


def run():
    example_1 = Example(TUBE)
    example_2 = Example(QUEUE)
    example_3 = Example(MEM)
    example_1.sim()
    example_2.sim()
    example_3.sim()


if __name__ == '__main__':
    run()
