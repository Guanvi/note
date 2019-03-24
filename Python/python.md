# Python 学习笔记

## 迭代

- 默认情况下,dict迭代的是key.如果要迭代value,可以用`for value in d.values()`,如果要同时迭代key和value,可以用`for k,v in d.items()`.


## 列表生成式

- `list(range(0,10))` #生成[0,1,2,3,4,5,6,7,8,9]


- 
  ```
  >>> [x * x for x in range(1,11)]
  #生成[1,4,9,16,25...100]

  for循环后加上if判断,筛选出仅偶数的平方
  >>> [x * x for x in range(1, 11) if x % 2 == 0]
  #生成[4, 16, 36, 64, 100]

  使用两层循环，可以生成全排列
  >>> [m + n for m in 'ABC' for n in 'XYZ']
  生成['AX', 'AY', 'AZ', 'BX', 'BY', 'BZ', 'CX', 'CY', 'CZ']
  ```




