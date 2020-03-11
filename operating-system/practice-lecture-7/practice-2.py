List=[1,2,3,4,1,2,5,1,2,3,4,5]  #此列表中存放将要访问的页面
print("访问序列")
print(List)

print("页面调度过程")
a_list=[]                       #此列表用来模拟LRU算法中的主存 最多存放3个数
count=0                         #记录缺页数
tag=1                           #标记是否缺页
for i in List:                  #将要访问的列表元素进行循环
    if i not in a_list:         #如果要访问的元素不在a_list中 即为缺页
        count+=1
        tag=1
        if len(a_list)<3:                   #如果a_list中没有放满
            a_list[len(a_list)::]=[i]       #等价于a_list.append(i)将元素i添加到a_list尾部
        else:                               #如果列表满了
            a_list[:2:]=a_list[1::]         #利用切片，将前两个元素替换为后两个元素，列表首元素出列表的功能
            a_list[2::]=[i]                 #将i元素放移动后的到列表最后
    else:                                   #i元素在列表中
        tag=0
        a_list[a_list.index(i)::]=a_list[a_list.index(i)+1::]#将i开始和元素后面的元素替换为i元素后面的元素
        a_list[len(a_list)::]=[i]                            #将i元素插入到移动后的列表后面
    print(a_list,"缺页发生"if tag==1 else "")
print("发生缺页次数:",count)

# LRU模拟
# 使用方法 python3 practice-2.py

# 访问序列
# [1, 2, 3, 4, 1, 2, 5, 1, 2, 3, 4, 5]

# 页面调度过程
# [1] 缺页发生
# [1, 2] 缺页发生
# [1, 2, 3] 缺页发生
# [2, 3, 4] 缺页发生
# [3, 4, 1] 缺页发生
# [4, 1, 2] 缺页发生
# [1, 2, 5] 缺页发生
# [2, 5, 1]
# [5, 1, 2]
# [1, 2, 3] 缺页发生
# [2, 3, 4] 缺页发生
# [3, 4, 5] 缺页发生

# 发生缺页次数: 10
