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
 * Scene production
 * Check if the scene is set to production
 */
fn check_max_render_production=
(
   return renderers.renderDialogMode == #production
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
   if not isArnold() do
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
   if not isArnold() do
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
 * Vray distributed rendering 
 * Check if the Vray distributed rendering is disabled
 */
fn check_max_vray_system_dr=
(
   if isVray() do
   (
      return renderers.current.system_distributedRender == false
   )
)

/*
 * Vray frame stamp 
 * Checks if the Vray Frame Stamp is disabled
 */
fn check_max_vray_system_frame_stamp=
(
   if isVray() do
   (
      return renderers.current.system_frameStamp_on == false
   )
)

/*
 * Vray mask value
 * Checks if vray render mask are disabled
 */
fn check_max_vray_render_mask=
(
   if isVray() do
   (
      return renderers.current.imageSampler_renderMask_type == 0
   )
)

/*
 * Vray Material override (Material)
 * Check if material override has a no material assigned
 */
fn check_max_vray_override_disabled=
(
   if isVray() do
   (
      renderers.current.options_overrideMtl_mtl == undefined
   )
)

/*
 * Vray hidden lights
 * Checks if render hidden lights is disabled
 */
fn check_max_vray_hidden_lights=
(
   if isVray() do
   (
      return renderers.current.options_hiddenLights == false
   )
)

/*
 * Corona distributed rendering
 * Check if the Corona distributed rendering is disabled
 */
fn check_max_corona_system_dr=
(
   if isCorona() do
   (
      return renderers.current.dr_enable == false
   )
)

/*
 * Vray vfb region
 * Check if the Vray VFB region is disabled
 */
fn check_max_vray_vfb_region=
(
   if isVray() do
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
   if isVray() do
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
 * Corona distributed rendering search LAN
 * Check if the Corona distributed rendering (search Lan) is disabled
 */
fn check_max_corona_system_dr_searchlan=
(
   if isCorona() do
   (
      return renderers.current.dr_searchDuringRender == false
   )
)

/*
 * Corona material override
 * Check if material override is disabled
 */
fn check_max_corona_override_disabled=
(
   if isCorona() do
   (
      return renderers.current.mtlOverride_enabled == false
   )
)

/*
 * Corona material override (Material)
 * Check if material override has a no material assigned
 */
fn check_max_corona_override_material_none=
(
   if isCorona() do
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
   if isCorona() do
   (
      return (
		      renderers.current.progressive_passLimit != 0 and 
		      renderers.current.progressive_timeLimit != 0 and
			   renderers.current.adaptivity_targetError != 0.0
		   )
   )
)

/*
 * Corona vfb region
 * Checks if Corona vfb region is disabled
 */
fn check_max_corona_vfb_region=
(
   if isCorona() do
   (
      renderers.current.system_vfbRegions.count == 3
   )
)
 



-- output_exists 
-- elements_duplicate ### if not arnold

-- missing_plugins
-- assets_exists
-- assets_unc_path




