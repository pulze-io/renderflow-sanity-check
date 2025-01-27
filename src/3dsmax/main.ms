/*
 * Untitled filename
 * Check if the filename is empty (untitled)
 */
fn check_max_untitled_filename=
(
   return maxfilename != ""
)

/*
 * Autoback filename
 * Check if the filename contains the word "autoback"
 */
fn check_max_autoback_filename=
(
   return findString (toLower maxfilename) "autoback" == undefined
)

/*
 * Recover filename
 * Check if the filename contains the word "recover"
 */
fn check_max_recover_filename=
(
   return findString maxfilename "recover" == undefined
)

/*
 * Empty scene
 * Check if the scene is empty
 */
fn check_max_empty_scene=
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
 * Active camera
 * Check if the scene has an active camera
 */
fn check_max_undefined_active_camera=
(
   return getActiveCamera() != undefined
)

-- scene_output_isnetworkpath
-- scene_output_exists
-- scene_output_movieformat
-- scene_elements_active
-- scene_elements_count
-- scene_elements_duplicate
-- scene_frame_single
-- scene_frame_range
-- scene_frame_nth
-- scene_frame_fps
-- scene_production
-- scene_units_display_type
-- scene_units_system_type
-- vray_vfb_region
-- vray_vfb_mousetrack
-- vray_dr
-- vray_system_dontrenderfinal
-- vray_system_override
-- vray_system_mask_selected
-- vray_system_mask_value
-- scene_pixel_aspect
-- scene_missing_plugins
-- corona_vfb_region
-- corona_dr
-- corona_dr_searchlan
-- corona_override
-- corona_infinite_render