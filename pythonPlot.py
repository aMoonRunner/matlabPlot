import matplotlib.pyplot as plt

# 示例数据
x = [1, 2, 3, 4, 5]
y = [10, 16, 5, 20, 12]

# 创建折线图
plt.plot(x, y, marker='o', linestyle='-')

# 设置图表标题和坐标轴标签
plt.title('example')
plt.xlabel('X')
plt.ylabel('Y')

# 显示图例
plt.legend(['data'])

# 显示网格线
plt.grid(True)

# 显示图表
plt.show()
