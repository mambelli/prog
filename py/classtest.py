class MyClass:
 __cvar1 = 'initial'
 __cvar2 = 2
 __cvar3 = 2
 __ivar1 = 'val1a'

 def __init__(self, in1, in2):
  print "Init: ", in1, in2
  self.__ivar1 = 'inst ' + in2
  self.__ivar2 = 'inst ' + in1

 def printall(self):
  print self.__dict__
  print MyClass.__cvar1
  print self.__cvar1
  print MyClass.__cvar2
  MyClass.__cvar2 += 1
  print MyClass.__cvar2
  print self.__cvar3
  self.__cvar3 += 1
  print self.__cvar3

v1 = MyClass('t1', 't2')
v2 = MyClass('t3', 't4')

print "Class: %s" % MyClass.__dict__
v1.printall()
print "Class: %s" % MyClass.__dict__
v2.printall()
print "Class: %s" % MyClass.__dict__
