# ratio = 375 / 375
# Framer.Device.contentScale = 1/ratio
# 
# 
# # Framer.DeviceComponent.Devices["my-device"] =
# # 	name: "My Device"
# # 	deviceType: "mobile"
# # 	deviceImage: "my-device.png"
# # # 	deviceImageWidth: 472
# # # 	deviceImageHeight: 806
# # 	screenWidth: 375
# # 	screenHeight: 667
# # Framer.DeviceComponent.deviceType = "my-device"
# Device.props =
# 	width: 375
# 	height: 667
# 	x: Align.center
# 	y: Align.center

Framer.Defaults.Animation =
	time: 0.3
	curve: Bezier.easeInOut
# if Screen.height == 812
# 	sup = 
Device.width = 375
Device.height = 667
Device.clip = true

if Screen.height >= 667 || Screen.width == 375
	Device.scale = 375/Screen.width
else if Screen.height >= 667 || Screen.width > 375
	Device.scale = Screen.width/375
else
	Device.scale = Screen.height/667

Device.y = 
Device.x = Align.center
homeContent.width = Device.width


storyItemNumber = 5
subItemNumber = 5
layerGap = 10
medium = 0
sub = 0
subContainer = []
originalLayers =[enter, enter2, enter3, enter4, enter5]
subLayers = [sub1, sub2, sub3, sub4]
Framer.Device.contentScale = (375 / 375)
Device.clip = true
Framer.Defaults.Animation =
	time: 0.3
	curve: Bezier.easeInOut

hotsubcontent = []
subNavi.y = 65
subNavi.parent = Device
subNavi.placeBehind(popup2)

subScroll = new ScrollComponent
	scrollVertical: false
	scrollHorizontal: false
	width: 375
	height:42
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
	for i in [0..3]
		sub = i
		layer = subLayers[i]
		layer.parent = subScroll.content
		layer.y = 12
		if i < 1
			layer.x = 14 + 40
		else
			layer.x = subContainer[sub - 1].x + subContainer[sub - 1].width + 23 + 10
# 		layer.onClick ->
# 			flow.showNext($2)
		subContainer.push(layer)
BG.sendToBack()

subContent()
subContainer[0].color = "#FF8200"
subContainer[0].fontFamily = '-apple-system'
subContainer[0].fontWeight = 500


homePageItem = []
homePageContent =(content) ->
	number = 3
	homeItemNumber = Math.ceil(number)
	for i in [0...2]
		medium = i			
		layer = Utils.randomChoice(originalLayers).copy()
		layer.x = 0
		layer.parent = content
		if i < 1
			layer.y = 116
		else 
			layer.y = 116 + homePageItem[0].height + layerGap
# 			print homePageItem[0].height
		homePageItem.push(layer)
homePageContent(hotContent)
destroyhomePage = ->
	for layer in homePageItem
		layer.destroy()

refresh = ->
	destroyhomePage()
	homePageContent(hotContent)
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
			layer.fontWeight = 400
			this.color = '#FF8200'
			this.fontFamily = '-apple-system'
			this.fontWeight = 500
		indexNumber = this.index - 16
# 		print indexNumber
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
	width: 375
	height: 1057
	parent: Device
	backgroundColor: "null"
	scrollVertical: false

page.placeBehind(Bottom)

page.draggable.enabled = false
page.draggable.propagateEvents = false
# homeContent.parent = page.content
# homeContent.y = 0
# homeContent.x = 0
page.y = 0
# page.addPage(Story,"left")
page.addPage(homeContent,"right")
# page.addPage(hotContent,"right")
for i in [0..3]
	layer = hotContent.copy()
	homePageContent(hotContent)
	hotsubcontent.push(layer)
	page.addPage(layer,"right")

page.addPage(Search,"right")

# page.addPage(Story,"left")
page.snapToPage(homeContent,false)

LeftEdge.draggable.horizontal = false
LeftEdge.draggable.vertical = false
LeftEdge.draggable.propagateEvents = false

RightEdge.draggable.horizontal = false
RightEdge.draggable.vertical = false
RightEdge.draggable.propagateEvents = false




page.content.on "change:x" ,->
	top.x = 0
	Bottom.x = 0
# 	print page.content.x
	if page.content.x <= 0 && page.content.x >= -375
		subNavi.x = Utils.modulate(page.content.x,[0,-375], [375,0])
# 		FixedStatusBar.opacity = Utils.modulate(page.content.x,[0,-375], [0,1])
	else if page.content.x <= -1875+375 && page.content.x >= -2250+375
		subNavi.x = Utils.modulate(page.content.x,[-1875+375,-2250+375], [0,-375])
# 	else if page.content.x <= -750 && page.content.x >= -1125
# 		FixedStatusBar.opacity = Utils.modulate(page.content.x,[-1124,-1125], [1,0])

# Search.onClick ->
# 	page.snapToPage(hotContent,true, animationOptions=curve: Bezier.easeInOut,time:.4)
	
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

ls = [l1,l3]
lss = [l1,l2,l3,l22]
l22.states =
	a:
		opacity: 0
		rotation: 0
		scale: 1
	b:
		opacity: 1
		rotation: 135
		scale:1.2
l22.stateSwitch('a')

for layer in ls
	layer.states =
		a:
			opacity: 1
			rotation: 0
		b:
			opacity: 0
			rotation: 45
	layer.stateSwitch('a')

l2.states =
	a:
		opacity: 1
		rotation: 0
		scale: 1
	b:
		opacity: 1
		rotation: 45
		scale: 1.2

icon.bringToFront()
icon.opacity = 0

popup1.states = 
	a:
		y: Top.height - popup1.height
	b:
		y: Top.height

popup2.states = 
	a:
		y: Top.height - popup2.height
	b:
		y: Top.height

popup2title.states = 
	a:
		opacity: 0
	b:
		options: 1
popup2title.stateSwitch('a')
popup2title.sendToBack()

popup2.stateSwitch('a')
mask.states =
	a:
		opacity: 0
	b:
		opacity: 1
mask.stateSwitch('a')
mask.sendToBack()
popup1.stateSwitch('a')

homeTitle.onClick ->
	if cpage0 == 0
		mask.placeBehind(popup1)
		popup1.stateCycle('b','a')
		mask.stateCycle('b','a')

mask.onClick ->
	popup1.stateCycle('a')
	popup2.stateCycle('a')
	for layer in lss
			layer.stateCycle('a')
	mask.stateCycle('a')
	Utils.delay 0.2, ->
		popup2title.stateCycle('a')
	Utils.delay 0.3, ->
		mask.sendToBack()
		Utils.delay 0.3, ->
			popup2title.sendToBack()

hotmore.onClick ->
	if cpage0 >= 1 && cpage0 <= 4
		popup2title.placeBehind(icon)
		popup2title.animate
			opacity: 1
		mask.placeBehind(popup2)
		Bottom.placeBefore(popup2)
		popup2.stateCycle('b','a')
		mask.stateCycle('b','a')
		for layer in lss
			layer.stateCycle('b','a')

homeTitle.fontWeight = 600
markScrollControl = ->
	if page.content.x <= 0 && page.content.x >= -375 + 187.5
		tabMask.width = Utils.modulate(page.content.x, [0, -375 + 187.5], [24+8, 89+8])
		tabMask.x = 114-4
		tabColorPad.x = 0
		homeTitle.opacity = Utils.modulate(page.content.x, [-375, -750 + 187.5], [1, 0.75])
		homeTitleIcon.opacity = Utils.modulate(page.content.x, [-375, -750 + 187.5], [1, 0.75])
		hotTitle.fontWeight = 400
		homeTitle.fontWeight = 600
		hotTitle.opacity = Utils.modulate(page.content.x, [0, -375 + 187.5], [0.5, 0.75])
# 		hotTitle.scale = Utils.modulate(page.content.x, [-375, -750 + 187.5], [1, 1.02])
# 		homeTitle.scale = Utils.modulate(page.content.x, [0, -375 + 187.5], [1, 1.02])
# 		
	else if page.content.x < -375 + 187.5 && page.content.x >= -375
		tabColorPad.x = Utils.modulate(page.content.x, [ -375 + 187.5,-375], [0, -64])
		tabMask.width = Utils.modulate(page.content.x, [-375 + 187.5, -375], [89+8, 24+8])
		tabMask.x = Utils.modulate(page.content.x, [-375 + 187.5, -375], [114-4, 178-4])
# 		tabColorPad.x = Utils.modulate(page.content.x, [-750 + 187.5, -750], [0, -142])
		homeTitle.opacity = Utils.modulate(page.content.x, [-375 + 187.5, -375], [0.75, 0.5])
		homeTitleIcon.opacity = Utils.modulate(page.content.x, [-375 + 187.5, -375], [0.75, 0.5])
		hotTitle.opacity = Utils.modulate(page.content.x, [-375 + 187.5, -375], [ 0.75, 1])
		hotTitle.fontWeight = 600
		homeTitle.fontWeight = 400
		icon.x = Utils.modulate(page.content.x, [-375 + 187.5, -375], [346+187.5, 346])
		icon.opacity = Utils.modulate(page.content.x, [-375 + 180, -375], [ 0, 1])
		hotTitle.scale = Utils.modulate(page.content.x, [-375 + 187.5, -375], [1.02, 1])
# 		homeTitle.scale = Utils.modulate(page.content.x, [-375 + 187.5, -375], [1.02, 1])
	if page.content.x <= -1500 && page.content.x >= -1875 + 187.5
		tabColorPad.x = -64
		tabMask.x = 178-4
		hotTitle.fontWeight = 600
		nearbyTitle.fontWeight = 400
		icon.x = Utils.modulate(page.content.x, [-1500, -1875 + 187.5], [346, 346-187.5])
		tabMask.width = Utils.modulate(page.content.x, [-1500, -1875 + 187.5], [24+8, 80])
		hotTitle.opacity = Utils.modulate(page.content.x, [-1500, -1875 + 187.5], [1,0.75])
		nearbyTitle.opacity = Utils.modulate(page.content.x, [-1500, -1875 + 187.5], [0.5, 0.75])
	else if page.content.x < -1875 + 187.5 && page.content.x >= -1875
		icon.x = Utils.modulate(page.content.x, [-1875 + 187.5, -1875], [346-187.5, 346-375])
		tabColorPad.x = Utils.modulate(page.content.x, [-1875 + 187.5,-1875], [-64, -120])
		tabMask.width = Utils.modulate(page.content.x, [-1875 + 187.5,-1875], [80, 24+8])
		tabMask.x = Utils.modulate(page.content.x, [-1875 + 187.5,-1875], [178-4, 234-4])
		hotTitle.fontWeight = 400
		nearbyTitle.fontWeight = 600
		hotTitle.opacity = Utils.modulate(page.content.x, [-1875 + 187.5,-1875], [ 0.75, 0.5])
		nearbyTitle.opacity = Utils.modulate(page.content.x, [-1875 + 187.5,-1875], [0.75, 1])
		

homeTitle.onClick ->
	page.snapToPage(homeContent,false)
	hotTitle.opacity = 0.5
	nearbyTitle.opacity = .5
	tabMask.width = 24
	tabMask.x = 114
# 	tabColorPad.x = 0

cpage0 = 0
cpage = 0
hotTitle.onClick ->
	homeTitle.opacity = .5
	nearbyTitle.opacity = .5
	tabMask.width = 24

	if cpage0 == 1
		page.snapToPage(hotsubcontent[0],false)
	else if cpage0 == 2
		page.snapToPage(hotsubcontent[1],false)
	else if cpage0 == 3
		page.snapToPage(hotsubcontent[2],false)
	else if cpage0 == 4
		page.snapToPage(hotsubcontent[3],false)
	else
		page.snapToPage(hotsubcontent[0],false)
nearbyTitle.onClick ->
	tabColorPad.x = -120
	page.snapToPage(Search,false)
	homeTitle.opacity = .5
	hotTitle.opacity = 0.5
	tabMask.width = 24
	tabMask.x = 234
page.content.on "change:x", -> markScrollControl()

page.on "change:currentPage", ->
	cpage0 = page.content.subLayers.indexOf(page.currentPage)
# 	print cpage0
	if cpage0 >= 1 && cpage0 <= 4
		cpage = cpage0
# 		icon.opacity = 1
	else
		cpage = 0
# 		icon.opacity = 0
	num = page.content.subLayers.indexOf(page.currentPage)
	for i in [0..3]
		if i == num-1
			subLayers[i].color = "#FF8200"
			subLayers[i].fontWeight = 600
		else
			subLayers[i].color = "#333"
			subLayers[i].fontWeight = 400

subLayers[0].onClick ->
	page.snapToPage(hotsubcontent[0])
subLayers[1].onClick ->
	page.snapToPage(hotsubcontent[1])
subLayers[2].onClick ->
	page.snapToPage(hotsubcontent[2])
subLayers[3].onClick ->
	page.snapToPage(hotsubcontent[3])
# 	print num

# markToMain.on Events.AnimationEnd, -> 
# 	print 1
# 	page.content.on "change:x", -> markScrollControl()
# markToHot.on Events.AnimationEnd, ->
# 	page.content.on "change:x", -> markScrollControl()