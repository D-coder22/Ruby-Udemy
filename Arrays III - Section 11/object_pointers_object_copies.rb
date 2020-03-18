a = [1,2,3]

b = [1,2,3]


p a.object_id
p b.object_id

c=a

p a.object_id
p c.object_id

a.push(4)
p a
p c


d=a.dup

p a.object_id==d.object_id
