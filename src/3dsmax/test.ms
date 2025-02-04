/*
 * Unit test for each check and fic function
 */

fn test=
(
	fileIn "helper.ms" -- include helpers
	fileIn "main.ms" -- include check and fix functions
	
	-- Untitled filename
	resetMaxFile #noPrompt
	assert (check_max_filenameUntitled() == false)

	-- Autoback filename
	saveMaxFile @"P:\projects\043_RF_Sanitycheck\model\AutoBackup.max" 
	assert (check_max_filenameAutoback() == false)
	saveMaxFile @"P:\projects\043_RF_Sanitycheck\model\testfile.max"
	assert (check_max_filenameAutoback() == true)

	-- Recover filename
	saveMaxFile @"P:\projects\043_RF_Sanitycheck\model\testfile_recover.max"
	assert (check_max_filenameRecover() == false)
	saveMaxFile @"P:\projects\043_RF_Sanitycheck\model\testfile.max"
	assert (check_max_filenameRecover() == true)

	-- Empty scene
	assert (check_max_sceneEmpty() == false)
	testBox = Box pos:[0,0,0] isSelected:off width:30 length:30 height:30
	assert (check_max_sceneEmpty() == true)

	-- Render type
	setRenderType #crop
	assert (check_max_renderType() == false)
	fix_max_renderType()
	assert (check_max_renderType() == true)

	-- Scene production
	renderers.renderDialogMode = #activeShade
	assert (check_max_renderProduction() == false)
	fix_max_renderProduction()
	assert (check_max_renderProduction() == true)

	-- Pixel aspect
	renderPixelAspect = 2.0
	assert (check_max_pixelAspect() == false)
	fix_max_pixelAspect()
	assert (check_max_pixelAspect() == true)

	-- Single frame
	rendTimeType = 2
	assert (check_max_frameSingle() == false)
	fix_max_frameSingle()
	assert (check_max_frameSingle() == true)

	-- Frame range
	rendTimeType = 1
	assert (check_max_frameRange() == false)
	rendTimeType = 2
	assert (check_max_frameRange() == true)

	-- Frame step
	rendNThFrame = 1
	assert (check_max_frameNth() == false)
	rendNThFrame = 5
	assert (check_max_frameNth() == true)

	-- Frame rate
	frameRate = 25
	assert (check_max_frameRate(30) == false)
	frameRate = 30
	assert (check_max_frameRate(30) == true)

	-- Output exists / Output movie format
	rendSaveFile = true
	rendOutputFilename = @"P:\projects\043_RF_Sanitycheck\comp\renderoutput\test_file.png"
	assert (check_max_outputEnabled() == true)
	rendOutputFilename = @"P:\projects\043_RF_Sanitycheck\comp\renderoutput\test_file.avi"
	assert (check_max_output_movieFormat() == false)
	rendOutputFilename = @"P:\projects\043_RF_Sanitycheck\comp\renderoutput\test_file.png"
	assert(check_max_output_movieFormat() == true)

	-- Network path
	rendOutputFilename = @"C:\Users\pulze\Desktop\test\test_file.png"
	assert (check_max_output_isNetworkpath() == false)
	rendOutputFilename = @"P:\projects\043_RF_Sanitycheck\comp\renderoutput\test_file.png"
	assert (check_max_output_isNetworkpath() == true)

	-- Units display type   
	units.DisplayType = #US
	assert (check_max_scene_displayUnit("cm") == false) 
	units.DisplayType = #Metric
	assert (check_max_scene_displayUnit("metric") == true)

	-- Units system type
	units.SystemType = #Inches
	assert (check_max_scene_systemUnit("centimeters") == false)
	units.SystemType = #Centimeters
	assert (check_max_scene_systemUnit("centimeters") == true)

	-- Set VRay
	if isVRay() == false do
	(
		renderers.current = Vray()
	)

	-- Elements count
	assert (check_max_elementsCount() == false)
	
	-- Add render element
	reManager = maxOps.GetCurRenderElementMgr()
	alphaElement = VRayAlpha()
	reManager.AddRenderElement alphaElement

	assert (check_max_elementsCount() == true)

	-- Elements active
	re = maxOps.GetCurRenderElementMgr()
	re.SetElementsActive false
	assert (check_max_elementsActive() == false)
	fix_max_elementsActive()
	assert (check_max_elementsActive() == true)

	-- Objects without materials
	assert (check_max_objects_noMaterials() == false)
	testMaterial = PhysicalMaterial()
	testBox.material = testMaterial
	assert (check_max_objects_noMaterials() == true)

	-- Vray distributed rendering
	renderers.current.system_distributedRender = true
	assert (check_max_vray_systemDr() == false)
	fix_max_vray_systemDr()
	assert (check_max_vray_systemDr() == true)

	-- Vray framestamp
	renderers.current.system_frameStamp_on = true
	assert (check_max_vray_frameStamp() == false)
	fix_max_vray_frameStamp()
	assert (check_max_vray_frameStamp() == true)

	-- Vray rendermask
	renderers.current.imageSampler_renderMask_type = 2
	assert (check_max_vray_renderMask() == false)
	fix_max_vray_renderMask()
	assert (check_max_vray_renderMask() == true)

	-- Vray min shading rate
	renderers.current.imageSampler_shadingRate = 12
	assert (check_max_vray_minShadingRate(6) == false)
	fix_max_vray_minShadingRate(6)
	assert (check_max_vray_minShadingRate(6) == true)

	-- Vray min subdivs
	renderers.current.progressive_minSamples = 3
	assert (check_max_vray_minSubdivs(1) == false)
	fix_max_vray_minSubdivs(1)
	assert (check_max_vray_minSubdivs(1) == true)

	-- Vray max subdivs
	renderers.current.progressive_maxSamples = 50
	assert (check_max_vray_maxSubdivs(100) == false)
	fix_max_vray_maxSubdivs(100)
	assert (check_max_vray_maxSubdivs(100) == true) 

	-- Vray noise threshold
	renderers.current.progressive_noise_threshold = 0.5
	assert (check_max_vray_noiseThreshold(0.01) == false)
	fix_max_vray_noiseThreshold(0.01)
	assert (check_max_vray_noiseThreshold(0.01) == true)

	-- Vray material override
	renderers.current.options_overrideMtl_on = true
	assert (check_max_vray_overrideDisabled() == false)
	fix_max_vray_overrideDisabled()
	assert (check_max_vray_overrideDisabled() == true)

	-- Vray hidden lights
	renderers.current.options_hiddenLights = true
	assert (check_max_vray_hiddenLights() == false)
	fix_max_vray_hiddenLights()
	assert (check_max_vray_hiddenLights() == true)

	-- Vray save raw file
	renderers.current.output_saveRawFile = false
	assert (check_max_vray_saveRawFile() == false)
	renderers.current.output_saveRawFile = true
	assert (check_max_vray_saveRawFile() == true)

	-- Vray raw filename
	renderers.current.output_rawFileName = ""
	assert (check_max_vray_rawFileName() == false)
	renderers.current.output_rawFileName = @"P:\projects\043_RF_Sanitycheck\comp\renderoutput\test.exr"
	assert (check_max_vray_rawFileName() == true)

	-- Vray seperate render channels
	renderers.current.output_splitgbuffer = false
	assert (check_max_vray_separateChannels() == false)
	renderers.current.output_splitgbuffer = true
	assert (check_max_vray_separateChannels() == true)

	-- Vray seperate folders
	renderers.current.output_separateFolders = false
	assert (check_max_vray_separateFolders() == false)
	renderers.current.output_separateFolders = true
	assert (check_max_vray_separateFolders() == true)

	-- Vray render channels filename
	renderers.current.output_splitfilename = ""
	assert (check_max_vray_renderChannelsName() == false)
	renderers.current.output_splitfilename = @"P:\projects\043_RF_Sanitycheck\comp\renderoutput\test.png"
	assert (check_max_vray_renderChannelsName() == true)

	-- Vray render channels rgb                                
	renderers.current.output_splitRGB = false
	assert (check_max_vray_renderChannelsRGB() == false)
	renderers.current.output_splitRGB = true
	assert (check_max_vray_renderChannelsRGB() == true)

	-- Vray render channels alpha
	renderers.current.output_splitAlpha = false
	assert (check_max_vray_renderChannelsAlpha() == false)
	renderers.current.output_splitAlpha = true
	assert (check_max_vray_renderChannelsAlpha() == true)

	-- Vray save vfb corrections
	renderers.current.output_correctChannels = false
	assert (check_max_vray_saveVfbCorrections() == false)
	renderers.current.output_correctChannels = true
	assert (check_max_vray_saveVfbCorrections() == true)

	-- Vray clear previous render
	renderers.current.system_previousRender = 4
	assert (check_max_vray_clearPreviousRender() == false)
	renderers.current.system_previousRender = 5
	assert (check_max_vray_clearPreviousRender() == true)

	-- Vray vfb region
	assert (check_max_vray_vfbRegion() == true)

	-- Vray vfb mousetrack
	assert (check_max_vray_vfbMousetrack() == true)

	-- Vray resumable rendering
	renderers.current.output_resumableRendering = true
	assert (check_max_vray_resumableRender() == false)
	renderers.current.output_resumableRendering = false	
	assert (check_max_vray_resumableRender() == true)

	-- Set corona
	if isCorona() == false do
	(
		renderers.current = Corona()
	)

	-- Corona distributed rendering
	renderers.current.dr_enable = true
	assert (check_max_corona_systemDr() == false)
	fix_max_corona_systemDr()
	assert (check_max_corona_systemDr() == true)

	-- Corona distributed rendering search lan
	renderers.current.dr_searchDuringRender = true
	assert (check_max_corona_systemDrSearchlan() == false)
	fix_max_corona_systemDrSearchlan()
	assert (check_max_corona_systemDrSearchlan() == true)

	-- Corona render selected
	renderers.current.renderSelected_mode = 1
	assert (check_max_corona_renderSelected() == false)
	fix_max_corona_renderSelected()
	assert (check_max_corona_renderSelected() == true)

	-- Corona material override
	renderers.current.mtlOverride_enabled = true
	assert (check_max_corona_overrideDisabled() == false)
	fix_max_corona_overrideDisabled()
	assert (check_max_corona_overrideDisabled() == true)

	-- Corona material override (material)
	overridemat = CoronaPhysicalMtl()
	renderers.current.mtlOverride = overridemat
	assert (check_max_corona_overrideNoMaterial() == false)
	renderers.current.mtlOverride = undefined
	assert (check_max_corona_overrideNoMaterial() == true)

	-- Corona infinite render
	renderers.current.progressive_passLimit = 10
	assert (check_max_corona_infiniteRender() == true) 
	renderers.current.progressive_passLimit = 0
	assert (check_max_corona_infiniteRender() == false)

	-- Corona render stamp
	renderers.current.renderstamp_use = true
	assert (check_max_corona_renderStamp() == false)
	fix_max_corona_renderStamp()
	assert (check_max_corona_renderStamp() == true)

	-- Corona vfb region
	assert (check_max_corona_vfbRegion() == true)

	-- Set fstorm
	if isFStorm() == false do
	(
		renderers.current = FStormRender()
	)
	
	-- FStorm render mask
	renderers.current.rendermask_on = true
	assert (check_max_fstorm_renderMask() == false) 
	fix_max_fstorm_renderMask()
	assert (check_max_fstorm_renderMask() == true)

	-- FStorm override
	renderers.current.gray_material_mode = true
	assert (check_max_fstorm_overrideDisabled() == false)
	fix_max_fstorm_overrideDisabled()
	assert (check_max_fstorm_overrideDisabled() == true)
)

test()