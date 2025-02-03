fileIn "./helper.ms"
fileIn "./main.ms"

-- Untitled filename
resetMaxFile #noPrompt
assert (check_max_filenameUntitled() == false)
 
-- Render type
setRenderType #crop
assert (check_max_renderType() == false)
fix_max_renderType()
assert (check_max_renderType() == true)

-- Render production
renderers.renderDialogMode = #activeShade
assert (check_max_renderProduction() == false)
fix_max_renderProduction()
assert (check_max_renderProduction() == true)

-- Pixel aspect
renderPixelAspect = 2.0
assert (check_max_pixelAspect() == false)
fix_max_pixelAspect()
assert (check_max_pixelAspect() == true)

-- Frames
rendTimeType = 2
assert (check_max_frameSingle() == false)
fix_max_frameSingle()
assert (check_max_frameSingle() == true)

rendTimeType = 1
assert (check_max_frameRange() == false)
rendTimeType = 2
assert (check_max_frameRange() == true)

rendNThFrame = 1
assert (check_max_frameNth() == false)
rendNThFrame = 5
assert (check_max_frameNth() == true)

-- FPS
frameRate = 25
assert (check_max_frameRate(30) == false)
frameRate = 30
assert (check_max_frameRate(30) == true)

-- Output
rendSaveFile = true
rendOutputFilename = "P:\projects\043_RF_Sanitycheck\comp\renderoutput\test_file.png"
assert (check_max_outputEnabled() == true)
rendOutputFilename = "P:\projects\043_RF_Sanitycheck\comp\renderoutput\test_file.avi"
assert (check_max_output_movieFormat() == false)
rendOutputFilename = "P:\projects\043_RF_Sanitycheck\comp\renderoutput\test_file.png"
assert(check_max_output_movieFormat() == true)

-- Networkpath
rendOutputFilename = "C:\Users\pulze\Desktop\test\test_file.png"
assert (check_max_output_isNetworkpath() == false)
rendOutputFilename = "P:\projects\043_RF_Sanitycheck\comp\renderoutput\test_file.png"
assert (check_max_output_isNetworkpath() == true)

-- Unit 
units.DisplayType = #US
assert (check_max_scene_displayUnit("cm") == false) 
units.DisplayType = #Metric
assert (check_max_scene_displayUnit("metric") == true)

units.SystemType = #Inches
assert (check_max_scene_systemUnit("centimeters") == false)
units.SystemType = #Centimeters
assert (check_max_scene_systemUnit("centimeters") == true)

-- Set VRay
renderers.current = if findString (classOf renderers.current as string) "V_Ray" != undefined then Default_Scanline_Renderer() else Vray()

-- Elements
assert (check_max_elementsCount() == false)
-- Add render element
reManager = maxOps.GetCurRenderElementMgr()
alphaElement = VRayAlpha()
reManager.AddRenderElement alphaElement

assert (check_max_elementsCount() == true)

-- Disables elements
re = maxOps.GetCurRenderElementMgr()
re.SetElementsActive false
assert (check_max_elementsActive() == false)
fix_max_elementsActive()
assert (check_max_elementsActive() == true)

-- Objects without materials
testBox = Box pos:[0,0,0] isSelected:off width:30 length:30 height:30
assert (check_max_objects_noMaterials() == false)
testMaterial = PhysicalMaterial()
testBox.material = testMaterial
assert (check_max_objects_noMaterials() == true)

-- Vray distributed rendering
renderers.current.system_distributedRender = true
assert (check_max_vray_systemDr() == false)
fix_max_vray_systemDr()
assert (check_max_vray_systemDr() == true)

-- Vray Framestamp
renderers.current.system_frameStamp_on = true
assert (check_max_vray_frameStamp() == false)
fix_max_vray_frameStamp()
assert (check_max_vray_frameStamp() == true)

-- Vray Rendermask
renderers.current.imageSampler_renderMask_type = 2
assert (check_max_vray_renderMask() == false)
fix_max_vray_renderMask()
assert (check_max_vray_renderMask() == true)

-- Vray Minshading
renderers.current.imageSampler_shadingRate = 12
assert (check_max_vray_minShadingRate(6) == false)
fix_max_vray_minShadingRate(6)
assert (check_max_vray_minShadingRate(6) == true)

--Vray Minsubdivs
renderers.current.progressive_minSamples = 3
assert (check_max_vray_minSubdivs(1) == false)
fix_max_vray_minSubdivs(1)
assert (check_max_vray_minSubdivs(1) == true)

-- Vray Maxsubdivs
renderers.current.progressive_maxSamples = 50
assert (check_max_vray_maxSubdivs(100) == false)
fix_max_vray_maxSubdivs(100)
assert (check_max_vray_maxSubdivs(100) == true) 

-- Vray Noisethreshold
renderers.current.progressive_noise_threshold = 0.5
assert (check_max_vray_noiseThreshold(0.01) == false)
fix_max_vray_noiseThreshold(0.01)
assert (check_max_vray_noiseThreshold(0.01) == true)

-- Vray Override
renderers.current.options_overrideMtl_on = true
assert (check_max_vray_overrideDisabled() == false)
fix_max_vray_overrideDisabled()
assert (check_max_vray_overrideDisabled() == true)

-- Vray Hiddenlights
renderers.current.options_hiddenLights = true
assert (check_max_vray_hiddenLights() == false)
fix_max_vray_hiddenLights()
assert (check_max_vray_hiddenLights() == true)


