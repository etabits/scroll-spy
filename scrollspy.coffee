class ScrollSpy
	constructor: (@navId) ->
		@track = {}
		aElements = document.getElementById(@navId).getElementsByTagName('a')
		
		@track[a.attributes.href.value.substr(1)] = a for a in aElements
		#console.log @track

		self = this
		window.onscroll = () ->
			self.onscroll.apply(self)
		window.onscroll()

	onscroll: () ->
		top = document.documentElement.scrollTop
		leastTop = 99999
		targetElem = false

		for id of @track
			elem = document.getElementById(id)
			elemTop = Math.abs elem.getBoundingClientRect().top
			
			if elemTop < leastTop
				leastTop = elemTop
				navElem = @track[id]
				targetElem = elem
				#console.log id, elemTop, '<<<'
			#else
			#	console.log '', id, elemTop

		if @prevElem
			@prevElem.parentNode.className = ''
		navElem.parentNode.className = 'active'
		@prevElem = navElem
		#console.log navElem




window.ScrollSpy = ScrollSpy
