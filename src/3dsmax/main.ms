/*
 * Untitled filename
 * Check if the filename is empty (untitled)
 * Save your file before submitting
 */
fn check_max_filename_untitled=
(
   return maxfilename != ""
)

/*
 * Autoback filename
 * Check if the filename contains the word "autoback"
 */
fn check_max_filename_autoback=
(
   return findString (toLower maxfilename) "autoback" == undefined
)

/*
 * Recover filename
 * Check if the filename contains the word "recover"
 */
fn check_max_filename_recover=
(
   return findString maxfilename "recover" == undefined
)

/*
 * Max save_as fix
 * Triggers the save_as dialog box
 */
fn fix_max_saves_as=
(
	local newFileName = getSaveFileName caption:"Save Scene As" types:"Max Files (*.max)|*.max"
	if (newFileName != undefined) do
	(
		saveMaxFile newFileName
	)
)

/*
 * Empty scene
 * Check if the scene is empty
 */
fn check_max_scene_empty=
(
   return rootScene.world.children.count > 0
)   

/*
 * Render type
 * Check if the render type is set to #view
 */
fn check_max_render_type=
(
   return getRenderType() == #view
)

/*
 * Render type fix
 * Stets the render type to view
 */
fn fix_max_render_type=
(
   setRenderType #view
)

/*
 * Scene production
 * Check if the scene is set to production
 */
fn check_max_render_production=
(
   return renderers.renderDialogMode == #production
)

/*
 * Render prdocution fix
 * Sets the render dialog mode to production
 */
fn fix_max_render_production=
(
   renderers.renderDialogMode = #production
)
 
/*
 * Pixel aspect
 * Check if the pixel aspect ratio is set to 1.0
 */
fn check_max_render_pixel_aspect=
(
  return renderPixelAspect == 1.0
)

/*
 * Pixel aspect fix
 * Sets the pixel aspect ratio to 1.0
 */
 fn fix_max_render_pixel_aspect=
 (
    renderPixelAspect = 1.0
 )

/*
 * Active camera
 * Check if the scene has an active camera
 */
fn check_max_camera_undefined=
(
   return getActiveCamera() != undefined
)

/*
 * Single Frame
 * Check if the scene is set to render a single frame
 */
fn check_max_frame_single= 
(
   return rendTimeType == 1
)

/*
 * Single frame fix
 * Sets the scene to single frame
 */
fn fix_max_frame_single=
(
   rendTimeType = 1
)

/*
 * Frame range
 * Check if the scene is set to render a frame range
 */
fn check_max_frame_range= 
(
   if (rendTimeType == 2 or rendTimeType == 3) then
   (
      return true
   )
   else
   (
      return false
   )
)

/*
 * Frame step
 * Check if the scene is set to render every Nth frame
 */
fn check_max_frame_nth= 
(
   return rendNThFrame > 1
)

/*
 * Frame rate
 * Check if the frame rate is set to right value
 */
fn check_max_frame_rate fps=
(
   return frameRate == fps
)

/*
 * Output exists
 * Check if the output file exists
 */
fn check_max_output_enabled=
(
	return rendSaveFile == true and rendOutputFilename != ""
)

/*
 * Output movie format
 * Check if the output file format is set to a movie format
 */
fn check_max_output_movieformat=
(
   return (getFilenameType rendOutputFilename != ".avi")
)

/*
 * Network path
 * Check if the output path is a network path
 */
fn check_max_output_isnetworkpath=
(
   return pathIsNetworkPath rendOutputFilename
)

/*
 * Units display type
 * Check if the units display type is set to the correct unit
 */
fn check_max_scene_units_display_type displayUnit=
(
   return units.DisplayType as string == displayUnit
)

/*
 * Units system type
 * Check if the units system type is set to the correct unit
 */
fn check_max_scene_units_system_type systemUnit=
(
   return units.SystemType as string == systemUnit
)

/*
 * Elements count
 * Check if the scene has render elements (AOVs excluded)
 */
fn check_max_elements_count= 
(
   if (not isArnold()) do
   (
     local re = maxOps.GetCurRenderElementMgr()

     local elements = re.numRenderElements()
     return elements > 0
   )
   
   return true
)
 
/*
 * Elements active
 * Check if the scene has elements activated (AOVs excluded)
 */
fn check_max_elements_active=
(
   if (not isArnold()) do
   (
      local re = maxOps.GetCurRenderElementMgr()
      if re != undefined then
      (
         return re.GetElementsActive()
      )
   )

   return true
)

/*
 * Fix elements active
 * Activates all render elements
 */
fn fix_max_elements_active=
(
   if (not isArnold()) do
   (
      local re = maxOps.GetCurRenderElementMgr()
      if re != undefined then
      (
         re.SetElementsActive true
      )
   )
)

/*
 * Vray distributed rendering 
 * Check if the Vray distributed rendering is disabled
 */
fn check_max_vray_system_dr=
(
   if (isVray()) do
   (
      return renderers.current.system_distributedRender != true
   )
)

/*
 * Fix Vray distributed rendering
 * Enables Vray distributed rendering
 */
fn fix_max_vray_system_dr=
(
   if (isVray()) do
   (
      renderers.current.system_distributedRender = false
   )
)

/*
 * Vray frame stamp 
 * Checks if the Vray frame stamp is disabled
 */
fn check_max_vray_system_frame_stamp=
(
   if (isVray()) do
   (
      return renderers.current.system_frameStamp_on != true
   )
)

/*
 * Fix Vray frame stamp
 * Disables the Vray frame stamp
 */
fn fix_max_vray_system_frame_stamp=
(
   if (isVray()) do
   (
      renderers.current.system_frameStamp_on = false
   )
)

/*
 * Vray mask value
 * Checks if vray render mask are disabled
 */
fn check_max_vray_render_mask=
(
   if (isVray()) do
   (
      return renderers.current.imageSampler_renderMask_type == 0
   )
)

/*
 * Fix Vray render mask
 * Disables the Vray render mask
 */
fn fix_max_vray_render_mask=
(
   if (isVray()) do
   (
      renderers.current.imageSampler_renderMask_type = 0
   )
)

/*
 * Vray min shading rate
 * Checks if the Vray min shading rate is matching
 */
fn check_max_vray_min_shading_rate arg=
(
   if (isVray()) do
   (
      return renderers.current.imageSampler_shadingRate == arg
   )
)

/*
 * Fix Vray min shading rate
 * Sets the Vray min shading rate
 */
fn fix_max_vray_min_shading_rate arg=
(
   if (isVray()) do
   (
      renderers.current.imageSampler_shadingRate = arg
   )
)

/*
 * Vray min subdivs
 * Checks if the Vray min subdivs is matching
 */
fn check_max_vray_min_subdivs arg=
(
   if (isVray()) do
   (
      return renderers.current.progressive_minSamples == arg
   )
)

/*
 * Fix Vray min subdivs
 * Sets the Vray min subdivs
 */
fn fix_max_vray_min_subdivs arg=
(
   if (isVray()) do
   (
      renderers.current.progressive_minSamples = arg
   )
)

/*
 * Vray max subdivs
 * Checks if the Vray max subdivs is matching
 */
fn check_max_vray_max_subdivs arg=
(
   if (isVray()) do
   (
      return renderers.current.progressive_maxSamples == arg
   )
)

/*
 * Fix Vray max subdivs
 * Sets the Vray max subdivs
 */
fn fix_max_vray_max_subdivs arg=
(
   if (isVray()) do
   (
      renderers.current.progressive_maxSamples = arg
   )
)

/*
 * Vray noise threshold
 * Checks if the Vray noise threshold is matching
 */
fn check_max_vray_noise_threshold arg=
(
   if (isVray()) do
   (
      return renderers.current.progressive_noise_threshold == arg
   )
)

/*
 * Fix Vray noise threshold
 * Sets the Vray noise threshold
 */
fn fix_max_vray_noise_threshold arg=
(
   if (isVray()) do
   (
      renderers.current.progressive_noise_threshold = arg
   )
)

/*
 * Vray Material override 
 * Check if material override is enabled
 */
 fn check_max_vray_override_disabled=
 (
    if (isVray()) do
    (
       return renderers.current.options_overrideMtl_on == false
    )
 )

/*
 * Fix Vray material override
 * Disables the Vray material override
 */
fn fix_max_vray_override_disable=
(
   if (isVray()) do
   (
      return renderers.current.options_overrideMtl_on = false
   )
)

/*
 * Vray hidden lights
 * Checks if render hidden lights is disabled
 */
fn check_max_vray_hidden_lights=
(
   if (isVray()) do
   (
      return renderers.current.options_hiddenLights == false
   )
)

/*
 * Fix Vray hidden lights
 * Disables the render hidden lights feature
 */
fn fix_max_vray_hidden_lights=
(
   if (isVray()) do
   (
      renderers.current.options_hiddenLights = false
   )
)

/*
 * Vray save raw file
 * Checks if Vray save raw file is enabled
 */
fn check_max_vray_saveRawFile=
(
   if (isVray()) do
   (
      return renderers.current.output_saveRawFile == true
   )
)

/*
 * Vray raw filename
 * Checks if the Vray raw filename is empty
 */
fn check_max_vray_rawFileName=
(
   if (isVray()) do
   (
      return renderers.current.output_rawFileName != ""
   )
)

/*
 * Vray seperate render channels
 * Checks if Vray separate render channels is enabled
 */
fn check_max_vray_separateChannels=
(
   if (isVray()) do
   (
      return renderers.current.output_splitgbuffer == true
   )
)

/*
 * Vray seperate folders
 * Checks if Vray separate folders is enabled
 */
fn check_max_vray_separateFolders=
(
   if (isVray()) do
   (
      return return renderers.current.output_separateFolders == true
   )
)

/*
 * Vray render channels filename
 * Checks if the Vray render channels filename is not empty
 */
fn check_max_vray_renderChannelsFileName=
(
   if (isVray()) do
   (
      return renderers.current.output_splitfilename != ""
   )
)

/*
 * Vray render channels rgb
 * Checks if the Vray render channels rgb is enabled
 */
fn check_max_vray_renderChannelsRGB=
(
   if (isVray()) do
   (
      return renderers.current.output_splitRGB == true
   )
)

/*
 * Vray render channels alpha
 * Checks if the Vray render channels alpha is enabled
 */
fn check_max_vray_renderChannelsAlpha=
(
   if (isVray()) do
   (
      return renderers.current.output_splitAlpha == true
   )

)
/*
 * Vray save vfb corrections
 * Checks if VFB color corrections are applied to the render elements
 */
fn check_max_vray_saveVfbCorrections=
(
   if (isVray()) do
   (
      return renderers.current.output_correctChannels == true
   )
)

/*
 * Vray clear previous render
 * Checks if the Vray clear previous render is enabled
 */
fn check_max_vray_clearPreviousRender=
(
   if (isVray()) do
   (
      return renderers.current.system_previousRender == 5
   )
)
 
/*
 * Vray vfb region
 * Check if the Vray VFB region is disabled
 */
fn check_max_vray_vfb_region=
(
   if (isVray()) do
   (
      deepEqual (vfbControl #getregion) #(#(0,0,0,0))
   )
)

/*
 * Vray vfb mousetrack
 * Checks if Vray vfb mousetrack is disabled
 */

fn check_max_vray_vfb_mousetrack=
(
   if (isVray()) do
   (
      item = vfbControl #trackmouse
      found = findItem item 0
      if found == 1 then
         return true
      else
         return false
   )
)

/*
 * Corona distributed rendering
 * Check if the Corona distributed rendering is disabled
 */
fn check_max_corona_system_dr=
(
   if (isCorona()) do
   (
      return renderers.current.dr_enable == false
   )
)

/*
 * Vray resumable rendering
 * Check if the Vray resumable rendering is disabled
 */
 fn check_max_vray_resumable_render=
 (
    if (isVray()) do
    (
       return renderers.current.output_resumableRendering == false
    )
 )

/*
 * Fix Corona distributed rendering
 * Disables the Corona distributed rendering
 */
fn fix_max_corona_system_dr=
(
   if (isCorona()) do
   (
      renderers.current.dr_enable = false
   )
)

/*
 * Corona distributed rendering search LAN
 * Check if the Corona distributed rendering (search Lan) is disabled
 */
fn check_max_corona_system_dr_searchlan=
(
   if (isCorona()) do
   (
      return renderers.current.dr_searchDuringRender == false
   )
)

/*
 * Fix Corona distributed rendering search LAN
 * Disables the Corona distributed rendering (search Lan)
 */
fn fix_max_corona_system_dr_searchlan=
(
   if (isCorona()) do
   (
      renderers.current.dr_searchDuringRender = false
   )
)

/*
 * Corona render selected
 * Checks if Corona render selected is disabled
 */
fn check_max_corona_render_selected=
(
   if (isCorona()) do
   (
      return renderers.current.renderSelected_mode == 0
   )
)

/*
 * Fix Corona render selected
 * Disables the Corona render selected
 */
fn fix_max_corona_render_selected=
(
   if (isCorona()) do
   (
      renderers.current.renderSelected_mode = 0
   )
)

/*
 * Corona material override
 * Check if material override is disabled
 */
fn check_max_corona_override_disabled=
(
   if (isCorona()) do
   (
      return renderers.current.mtlOverride_enabled == false
   )
)

/*
 * Fix Corona material override
 * Disables Corona material override
 */
fn fix_max_corona_material_override=
(
   renderers.current.mtlOverride_enabled = false
)

/*
 * Corona material override (Material)
 * Check if material override has a no material assigned
 */
fn check_max_corona_override_material_none=
(
   if (isCorona()) do
   (
      return renderers.current.mtlOverride == undefined
   )
)

/*
 * Corona infinite render
 * Checks if no limits are set in the render settings
 */
fn check_max_corona_infinite_render=
(
   if (isCorona()) do
   (
      return (
		      renderers.current.progressive_passLimit != 0 and 
		      renderers.current.progressive_timeLimit != 0 and
			   renderers.current.adaptivity_targetError != 0.0
		   )
   )
)

/*
 * Corona render stamp
 * Checks if Corona render stamp is disabled
 */
fn check_max_corona_render_stamp=
(
   if (isCorona()) do
   (
      return renderers.current.renderstamp_use
   )
)

/*
 * Fix Corona render stamp
 * Disables the Corona render stamp
 */
fn fix_max_corona_render_stamp=
(
   if (isCorona()) do
   (
      renderers.current.renderstamp_use = false
   )
)

/*
 * Corona vfb region
 * Checks if Corona vfb region is disabled
 */
fn check_max_corona_vfb_region=
(
   if (isCorona()) do
   (
      renderers.current.system_vfbRegions.count == 3
   )
)
 
/*
 * FStorm render mask
 * Checks if FStorm render masks are disabled
 */
fn check_max_fstorm_render_mask=
(
   if (isFStorm()) do
   (
      return renderers.current.rendermask_on == false
   )
)

/*
 * FStorm override
 * Checks if Fstorm override is disabled
 */
 fn check_max_fstorm_override=
 (
    if (isFStorm()) do
    (
       return renderers.current.gray_material_mode == false
    )
 )


-- output_exists 
-- elements_duplicate ### if not arnold

-- missing_plugins
-- assets_exists
-- assets_unc_path

