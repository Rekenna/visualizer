App.Visualizer =

	readFrequencyData: (e) =>
		requestAnimationFrame(V.readFrequencyData)
		V.analyser.getByteFrequencyData(V.frequencyData)
		V.drawData(V.frequencyData)
		return

	canvas: document.getElementById('visualizer')
	d3: d3.select('canvas#visualizer')
	viewWidth: window.innerWidth
	viewHeight: window.innerHeight

	drawData: (data) ->
		i = 0
		while i < data.length
			V.path._segments[i].point.y = V.viewHeight - data[i]
			i++
		return

	init: (play) =>

		# Audio
		V.audioCtx = new (window.AudioContext || window.webkitAudioContext)()
		V.analyser = V.audioCtx.createAnalyser()
		V.audioElement = document.getElementById('audioElement')
		V.source = V.audioCtx.createMediaElementSource(audioElement)
		V.source.connect(V.analyser)
		V.source.connect(V.audioCtx.destination)
		V.frequencyData = new Uint8Array(V.analyser.frequencyBinCount)

		# Paper
		paper.setup(V.canvas)

		# Create a Paper.js Path to draw a line into it:
		path = new Path();
		path.strokeColor = 'rgba(255,255,255, .6)'
		path.strokeWidth = '2'


		width = V.viewWidth
		spacing = width/(V.frequencyData.length)
		i = 0
		while i < (V.frequencyData.length)
			max = Math.floor(V.viewHeight)
			min = Math.ceil(V.viewHeight - 50)
			path.add(new Point(V.frequencyData[i] + i*spacing, Math.floor(Math.random() * (max - min)) + min))
			i++

		path.closed = false;
		path.smooth()

		# Select the path, so we can see its handles:
		path.fullySelected = false;

		V.path = path
		# Draw the view now:
		view.draw()
		V.readFrequencyData()

		return

	#/ App.Visualizer

V = App.Visualizer

$(window).resize ->
	V.viewWidth = window.innerWidth
	V.viewHeight = window.innerHeight
	V.drawData(V.frequencyData)
	return
