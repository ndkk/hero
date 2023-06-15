#!/usr/bin/python3

# 打开文件
fo = open("maps.txt", "r+")
print ("文件名为: ", fo.name)
dstfo = open("city_dst.txt", "w+")

for line in fo:
    linedst = line
    # print ("读取的字符串: %s" % (line))
    if "tile=" in line:
        linearr1 = line.split("=")
        linearr2 = linearr1[1].split(",")
        dstno = linearr2[0]
        dstno = int(dstno) + 10
        linearr2[0] = str(dstno)
        linedst = "tile=" + ','.join(linearr2)
    dstfo.write(linedst)
# 关闭文件
fo.close()
dstfo.close()

