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


-- frame_single  
-- frame_range  
-- frame_nth  
-- output_enabled  
-- output_isnetworkpath  
-- output_movieformat
-- output_exists 
-- units_display_type  
-- units_system_type  
-- production  
-- pixel_aspect  
-- frame_fps  
-- elements_active ### if not arnold
-- elements_duplicate ### if not arnold
-- elements_count --- greater than 0 / if not arnold
-- missing_plugins

-- vray_vfb_region
-- vray_vfb_mousetrack
-- vray_dr
-- vray_system_dontrenderfinal
-- vray_system_override
-- vray_system_mask_selected
-- vray_system_mask_value

-- corona_vfb_region
-- corona_dr
-- corona_dr_searchlan
-- corona_override
-- corona_infinite_render

