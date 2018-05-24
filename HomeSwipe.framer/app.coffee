storyItemNumber = 5
subItemNumber = 5
layerGap = 10
medium = 0
sub = 0
subContainer = []
originalLayers =[enter, enter2, enter3, enter4, enter5]
subLayers = [sub1, sub2, sub3, sub4, sub5, sub6, sub7, sub8, sub9, sub10, sub11, sub12, sub13]

Device.clip = true
Framer.Defaults.Animation =
	time: 0.3
	curve: Bezier.easeInOut

subScroll = new ScrollComponent
	scrollVertical: false
	width: Screen.width
	backgroundColor: null
	parent: subNavi
	contentInset: 
		right: - 550
subScroll.mouseWheelEnabled = true
subScroll.draggable.enabled = true
subScroll.draggable.horizontal = false
subScroll.draggable.vertical = false
subScroll.draggable.propagateEvents = false
subScroll.sendToBack()

subContent = ->
	for i in [0..6]
		sub = i
		layer = subLayers[i]
		layer.parent = subScroll.content
		layer.y = 12
		if i < 1
			layer.x = 14
		else
			layer.x = subContainer[sub - 1].x + subContainer[sub - 1].width + 23
# 		layer.onClick ->
# 			flow.showNext($2)
		subContainer.push(layer)
BG.sendToBack()

subContent()
subContainer[0].color = "#FF8200"
subContainer[0].fontFamily = '-apple-system'
subContainer[0].fontWeight = 500


homePageItem = []
homePageContent = ->
	number = 3
	homeItemNumber = Math.ceil(number)
	for i in [0...2]
		medium = i			
		layer = Utils.randomChoice(originalLayers).copy()
		layer.x = Align.center
		layer.parent = hotContent
		if i < 1
			layer.y = 116
		else 
			layer.y = 116 + homePageItem[0].height + layerGap
# 			print homePageItem[0].height
		homePageItem.push(layer)
homePageContent()
destroyhomePage = ->
	for layer in homePageItem
		layer.destroy()

refresh = ->
	destroyhomePage()
	homePageContent()
# 	scroll.animate
# 		scrollY: 0
# 		y: 0
# 		options: 
# 			time: 0.01
	
	


TextLayerContainer = []
subPopupActionContainer = []

indexNumber = 0
for layer,i in subContainer
	layer.onClick ->
		for layer,i in subContainer
			layer.color = '#333333'
			layer.fontWeight = ''
			this.color = '#FF8200'
			this.fontFamily = '-apple-system'
			this.fontWeight = 500
		indexNumber = this.index - 16
# 		print indexNumber
		if indexNumber >= 0 and indexNumber <= 3
			subScroll.animate
				scrollX: 0
		if indexNumber > 3 and indexNumber < 7
			subScroll.animate
				scrollX: subContainer[indexNumber].x - 200 - subContainer[indexNumber].width
# 		if indexNumber < 13 and indexNumber >= 10
# 			subScroll.animate
# 				scrollX: subContainer[12].x
		for layer in TextLayerContainer
			layer.color = '#333333'
			layer.fontWeight = ''
			TextLayerContainer[indexNumber-1].color = '#FF8200'
			TextLayerContainer[indexNumber-1].fontFamily = '-apple-system'
			TextLayerContainer[indexNumber-1].fontWeight = 500
		refresh()
# 		overdrag()




		
TopPadding = Top.height

page = new PageComponent
	width: Screen.width
	height: 1057
	parent: Device
	backgroundColor: "null"
	scrollVertical: false
page.sendToBack()
page.draggable.enabled = false
page.draggable.propagateEvents = false
# homeContent.parent = page.content
# homeContent.y = 0
# homeContent.x = 0
page.y = 0
page.addPage(Story,"left")
page.addPage(homeContent,"right")
page.addPage(hotContent,"right")
page.addPage(Search,"right")

# page.addPage(Story,"left")
page.snapToPage(homeContent,false)

LeftEdge.draggable.horizontal = false
LeftEdge.draggable.vertical = false
LeftEdge.draggable.propagateEvents = false

RightEdge.draggable.horizontal = false
RightEdge.draggable.vertical = false
RightEdge.draggable.propagateEvents = false

Story2.parent = Device
Story2.x = -Screen.width
Story2.y = 0

Search2.parent = Device
Search2.x = Screen.width
Search2.y = 0


GoStory.onClick ->
	Story2.bringToFront()
	Story2.animate
		x: 0
		options:
			curve: Bezier.easeInOut
			time:.4
	page.animate
		x: 375
		options:
				curve: Bezier.easeInOut
				time:.4
	Top.animate
		x: 375
		options:
				curve: Bezier.easeInOut
				time:.4
	Bottom.animate
		x: 375
		options:
				curve: Bezier.easeInOut
				time:.4
	
GoSearch.onClick ->
	Search2.bringToFront()
	Search2.animate
		x: 0
		options:
			curve: Bezier.easeInOut
			time:.4
	page.animate
		x: -375
		options:
				curve: Bezier.easeInOut
				time:.4
	Top.animate
		x: -375
		options:
				curve: Bezier.easeInOut
				time:.4
	Bottom.animate
		x: -375
		options:
				curve: Bezier.easeInOut
				time:.4


Story2.onClick ->
	Story2.animate
		x: -375
		options:
			curve: Bezier.easeInOut
			time:.4
	page.animate
		x: 0
		options:
				curve: Bezier.easeInOut
				time:.4
	Top.animate
		x: 0
		options:
				curve: Bezier.easeInOut
				time:.4
	Bottom.animate
		x: 0
		options:
				curve: Bezier.easeInOut
				time:.4
	
Story2.onSwipeLeft ->
	Story2.animate
		x: -375
		options:
			curve: Bezier.easeInOut
			time:.4
	page.animate
		x: 0
		options:
				curve: Bezier.easeInOut
				time:.4
	Top.animate
		x: 0
		options:
				curve: Bezier.easeInOut
				time:.4
	Bottom.animate
		x: 0
		options:
				curve: Bezier.easeInOut
				time:.4

Search2.onClick ->
	Search2.animate
		x: 375
		options:
			curve: Bezier.easeInOut
			time:.4
	page.animate
		x: 0
		options:
				curve: Bezier.easeInOut
				time:.4
	Top.animate
		x: 0
		options:
				curve: Bezier.easeInOut
				time:.4
	Bottom.animate
		x: 0
		options:
				curve: Bezier.easeInOut
				time:.4
	
Search2.onSwipeLeft ->
	Search2.animate
		x: 375
		options:
			curve: Bezier.easeInOut
			time:.4
	page.animate
		x: 0
		options:
				curve: Bezier.easeInOut
				time:.4
	Top.animate
		x: 0
		options:
				curve: Bezier.easeInOut
				time:.4
	Bottom.animate
		x: 0
		options:
				curve: Bezier.easeInOut
				time:.4



page.content.on "change:x" ,->
# 	print page.content.x
	if page.content.x <= 0 && page.content.x >= -375
		Top.x = Utils.modulate(page.content.x,[0,-375], [375,0])
		Bottom.x = Utils.modulate(page.content.x,[0,-375], [375,0])
		FixedStatusBar.opacity = Utils.modulate(page.content.x,[0,-375], [0,1])
	else if page.content.x <= -750 && page.content.x >= -1125
		Top.x = Utils.modulate(page.content.x,[-750,-1125], [0,-375])
		Bottom.x = Utils.modulate(page.content.x,[-750,-1125], [0,-375])
# 		FixedStatusBar.opacity = Utils.modulate(page.content.x,[-1124,-1125], [1,0])

Story.onClick ->
	page.snapToPage(homeContent,true, animationOptions=curve: Bezier.easeInOut,time:.4)
Search.onClick ->
	page.snapToPage(hotContent,true, animationOptions=curve: Bezier.easeInOut,time:.4)
	
tabMask.clip = true

markToMain = new Animation
	layer: tabMask
	properties: {x: 138}
	time: 0.25
	curve: "ease"

# colorToMain = new Animation
# 	layer: tabColorPad
# 	properties: {x: 0}
# 	time: 0.25
# 	curve: "ease"

markToHot = new Animation
	layer: tabMask
	properties: {x: 209}
	time: 0.25
	curve: "ease"

# colorToHot = new Animation
# 	layer: tabColorPad
# 	properties: {x: -152}
# 	time: 0.25
# 	curve: "ease"
	
markScrollControl = ->
	if page.content.x <= -375 && page.content.x >= -750 + 187.5
		tabMask.width = Utils.modulate(page.content.x, [-375, -750 + 187.5], [24, 96])
		tabMask.x = 138
# 		tabColorPad.x = -375
		homeTitle.opacity = Utils.modulate(page.content.x, [-375, -750 + 187.5], [1, 0.75])
		homeTitleIcon.opacity = Utils.modulate(page.content.x, [-375, -750 + 187.5], [1, 0.75])
# 		hotTitle.opacity = Utils.modulate(page.content.x, [-375, -750 + 187.5], [0.5, 0.75])
# 		hotTitle.scale = Utils.modulate(page.content.x, [-375, -750 + 187.5], [1, 1.02])
# 		homeTitle.scale = Utils.modulate(page.content.x, [-375, -750 + 187.5], [1.03, 1.02])
		
	else if page.content.x < -750 + 187.5 && page.content.x >= -750
		tabMask.width = Utils.modulate(page.content.x, [-750 + 187.5, -750], [96, 24])
		tabMask.x = Utils.modulate(page.content.x, [-750 + 187.5, -750], [138, 209])
# 		tabColorPad.x = Utils.modulate(page.content.x, [-750 + 187.5, -750], [0, -142])
		homeTitle.opacity = Utils.modulate(page.content.x, [-750 + 187.5, -750], [0.75, 0.5])
		homeTitleIcon.opacity = Utils.modulate(page.content.x, [-750 + 187.5, -750], [0.75, 0.5])
		hotTitle.opacity = Utils.modulate(page.content.x, [-750 + 187.5, -750], [ 0.75, 1])
# 		hotTitle.scale = Utils.modulate(page.content.x, [-750 + 187.5, -750], [1.02, 1.03])
# 		homeTitle.scale = Utils.modulate(page.content.x, [-750 + 187.5, -750], [1.02, 1])

homeTitle.onClick ->
	page.snapToPage(homeContent,true, animationOptions=curve: Bezier.easeInOut,time:.4)
hotTitle.onClick ->
	page.snapToPage(hotContent,true, animationOptions=curve: Bezier.easeInOut,time:.4)
page.content.on "change:x", -> markScrollControl()

# markToMain.on Events.AnimationEnd, -> 
# 	print 1
# 	page.content.on "change:x", -> markScrollControl()
# markToHot.on Events.AnimationEnd, ->
# 	page.content.on "change:x", -> markScrollControl()