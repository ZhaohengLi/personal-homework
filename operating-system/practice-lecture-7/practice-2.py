# 测试输入
input = ['c', 'c', 'd', 'b', 'c', 'e', 'c', 'e', 'a', 'd']
T = 2

# initial state
pages_lastHit = {}
pages_lastHit['a'] = 0
pages_lastHit['d'] = 0
pages_lastHit['e'] = 0
lastPF = 0

print "Initial State:", pages_lastHit
for i in range(0, len(input)):
    visitPage = input[i]
    print "Visit page", visitPage,
    if pages_lastHit.has_key(visitPage):
        print "Hit " + visitPage,
        pages_lastHit[visitPage] = i+1
    else:
        print "(Interrupt)page Fault",
        if (i+1) - lastPF > T:
            # delete all unused pages since last Page Fault
            existingPages = pages_lastHit.keys()
            for page in existingPages:
                if(pages_lastHit[page] <= lastPF):
                    pages_lastHit.pop(page, None)
            pages_lastHit[visitPage] = i+1
        else:
            # just add the missing page
            pages_lastHit[visitPage] = i+1
        lastPF = i+1
    print ""
    print pages_lastHit

# 页面调度过程如下
# Initial State: {'a': 0, 'e': 0, 'd': 0}
# Visit page c (Interrupt)page Fault
# {'a': 0, 'c': 1, 'e': 0, 'd': 0}
# Visit page c Hit c
# {'a': 0, 'c': 2, 'e': 0, 'd': 0}
# Visit page d Hit d
# {'a': 0, 'c': 2, 'e': 0, 'd': 3}
# Visit page b (Interrupt)page Fault
# {'c': 2, 'b': 4, 'd': 3}
# Visit page c Hit c
# {'c': 5, 'b': 4, 'd': 3}
# Visit page e (Interrupt)page Fault
# {'c': 5, 'b': 4, 'e': 6, 'd': 3}
# Visit page c Hit c
# {'c': 7, 'b': 4, 'e': 6, 'd': 3}
# Visit page e Hit e
# {'c': 7, 'b': 4, 'e': 8, 'd': 3}
# Visit page a (Interrupt)page Fault
# {'a': 9, 'c': 7, 'e': 8}
# Visit page d (Interrupt)page Fault
# {'a': 9, 'c': 7, 'e': 8, 'd': 10}