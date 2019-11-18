# 笔记

### Java基本数据类型
|基本类型|所占字节|对应的引用类型|
|:-:|:-:|:-:|
|byte|1|java.lang.Byte|
|short|2|java.lang.Short|
|int|4|	java.lang.Integer|
|long|8|java.lang.Long|
|float|4|java.lang.Float|
|double|8|java.lang.Double|
|char|2|java.lang.Character|
|boolean||java.lang.Boolean|


### 面向对象  
- 封装
	- 封装是面向对象方法的重要原则，就是把对象的属性和操作结合为一个独立的整体，并尽可能隐藏对象的内部实现细节
	- 可以通过访问控制符实现封装
		```
		定义为public的class、interface可以被其他任何类访问
		定义为public的field、method可以被其他类访问
		定义为private的field、method无法被其他类访问
		protected作用于继承关系。定义为protected的字段和方法可以被子类访问，以及子类的子类
		包作用域(package)是指一个类允许访问同一个package的没有public、private修饰的class以及没有public、protected、private修饰的字段和方法
		```
- 继承
	```
	继承是面向对象编程的一种强大的代码复用方式
	Java只允许单继承，所有类最终的根类是Object
	protected允许子类访问父类的字段和方法
	子类的构造方法可以通过super()调用父类的构造方法
	可以安全地向上转型为更抽象的类型
	可以强制向下转型，最好借助instanceof判断
	子类和父类的关系是is，has关系不能用继承
	```
- 多态
	
	- 多态
		```
		多态是指，针对某个类型的方法调用，其真正执行的方法取决于运行时期实际类型的方法
		super
		指向父类的引用,可以用它调用父类的变量和方法
		子类用它调用父类的构造方法时需出现在子类构造方法的第一句

		this
		指向本类对象的引用，可以调用本类或父类对象的变量和方法
		```

	- 重载
		```
		重载是指多个方法的方法名相同，返回类型也相同，但各自的参数不同
		```
	- 重写
		```
		重写是指子类重新编写父类方法的方法体
		```
- 抽象
	- 抽象类和抽象方法
		```
		使用abstract修饰的类就是抽象类,抽象类无法被实例化，从抽象类继承的子类必须实现抽象方法
		使用abstract修饰的方法是抽象方法，它只有定义，没有实现。抽象方法定义了子类必须实现的接口规范
		如果不实现抽象方法，则该子类仍是一个抽象类
		面向抽象编程使得调用者只关心抽象方法的定义，不关心子类的具体实现
		```
	- 接口
		```
		Java的接口（interface）定义了纯抽象规范，一个类可以实现多个接口；
		接口也是数据类型，适用于向上转型和向下转型；
		接口的所有方法都是抽象方法，接口不能定义实例字段；
		interface是可以有静态字段的，并且静态字段必须为final类型
		实际上，因为interface的字段只能是public static final类型，所以我们可以把这些修饰符都去掉
		接口可以定义default方法（JDK>=1.8）。
		```
---

### String
- Java字符串String是不可变对象
- String常用方法

	- equals()  

		```
		比较字符串的内容是否相同
		s1.equals(s2)
		```
	- equalsIgnoreCase()  
		```
		忽略大小写的比较
		```
	- contains()
  
		```
		是否包含某个子串 
		"Hello".contains("ll");
		```

	- indexOf()  
		```
		"Hello".indexOf("l"); //2
		```

	- lastIndexOf()  
		```
		"Hello".lastIndexOf("l"); //3
		```
	- startsWith()  
		```
		"Hello".startsWith("He"); //true
		```
	- endsWith()  

		```
		"Hello".endsWith("lo");//true
		```

	- sbustring()    
		```
		返回子串
		"Hello".substring(2); //"llo"  
		"Hello".substring(2, 4); "ll"
		```

	- isEmpty()` <small>和</small> `isBlank()`  
		```
		"".isEmpty(); // true，因为字符串长度为0  
		"  ".isEmpty(); // false，因为字符串长度不为0
		"  \n".isBlank(); // true，因为只包含空白字符
		" Hello ".isBlank(); // false，因为包含非空白字符
		```

	- replace()  
		```
		替换子串
		String s = "hello";
		s.replace('l', 'w'); // "hewwo"，所有字符'l'被替换为'w'
		s.replace("ll", "~~"); // "he~~o"，所有子串"ll"被替换为"~~"
		```

	- split()  
		```
		分割字符串
		String s = "A,B,C,D";
		String[] ss = s.split("\\,"); // {"A", "B", "C", "D"}
		```

	- join()  
		```
		拼接字符串
		String[] arr = {"A", "B", "C"};
		String s = String.join("***", arr); // "A***B***C"
		```

	- valueOf()  
		```
		类型转换
		String.valueOf(123); // "123"
		String.valueOf(45.67); // "45.67"
		String.valueOf(true); // "true"
		String.valueOf(new Object()); // 类似java.lang.Object@636be97c
		```

	- toCharArray()  
		```
		转换为char[]
		char[] cs = "Hello".toCharArray(); // String -> char[]
		String s = new String(cs); // char[] -> String
		```

	- getBytes()  

		```
		字符串编码
		byte[] b1 = "Hello".getBytes(); // 按ISO8859-1编码转换，不推荐
		byte[] b2 = "Hello".getBytes("UTF-8"); // 按UTF-8编码转换
		byte[] b2 = "Hello".getBytes("GBK"); // 按GBK编码转换
		byte[] b3 = "Hello".getBytes(StandardCharsets.UTF_8); // 按UTF-8编码转换

		把已知编码的byte[]转换为String
		byte[] b = ...
		String s1 = new String(b, "GBK"); // 按GBK转换
		String s2 = new String(b, StandardCharsets.UTF_8); // 按UTF-8转换
		```
	- 



---
### StringBuilder 和 StringBuffer
```
StringBuilder是可变对象，用来高效拼接字符串；
StringBuilder可以支持链式操作，实现链式操作的关键是返回实例本身；
StringBuffer是StringBuilder的线程安全版本，现在很少使用。
```




### 集合

- List  
	- void add(E e)  
		```
		在末尾添加一个元素
		```
	- void add(int index, E e)  
		```
		在指定索引添加一个元素
		```


	- int remove(int index)  
		```
		删除指定索引的元素
		```
	- int remove(Object e)
		```
		删除某个元素
		```
	- int size() 
		```
		获取链表大小（包含元素的个数）
		```
	- E get(int index 

		```
		获取指定索引的元素
		```



- Map  

	- Object put(Object k, Object v)  

		```
		将指定的值与此映射中的指定键关联(可选操作)
		```
	- void putAll(Map m)
		```
		从指定映射中将所有映射关系复制到此映射中(可选操作)
		```
	- Set entrySet()
		```
		返回此映射中包含的映射关系的Set视图
		```
	- Set keySet( )
		```
		返回此映射中包含的键的 Set 视图
		```
	- Object get(Object k)
		```
		返回指定键所映射的值；如果此映射不包含该键的映射关系，则返回null
		```
	- int size()
		```
		返回此映射中的键-值映射关系数
		```


- Set 
	- boolean add(E e)
		```
		如果指定的元素不存在，则将其指定的元素添加（可选操作）
		```
	- boolean addAll(Collection<? extends E> c)
		```
		将指定集合中的所有元素添加到此集合
		```
	- boolean contains(Object o)
		```
		如果此集合包含指定的元素，则返回true
		```  
	- boolean containsAll(Collection<?> c)
		```
		如果此集合包含所有指定集合的元素,则返回true 
		```  
	- boolean remove(Object o)
		```
		如果存在，则从该集合中删除指定的元素
		```  
	- Object[] toArray()
		```
		返回一个包含此集合中所有元素的数组
		```  
