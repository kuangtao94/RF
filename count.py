
class Count(object):
	def add(self,a,b):
		r"""
		用于两个数进行相加,a,b
		add | a | b
		"""
		c = int(a) + int(b)
		return c
		
	def sub(self,a,b):
		r"""
		用于两个数进行相减,a,b
		sub | a | b
		"""
		c = int(a) - int(b)
		return c
		
if __name__ == "__main__":
	count = Count()
	result = count.add(3,5)
	assert result == 8
	result = count.sub(3,5)
	assert result == -2
	