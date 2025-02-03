fileIn "./helper.ms"
fileIn "./main.ms"

resetMaxFile #noPrompt

-- Untitled filename
check_max_filename_untitled_result = check_max_filename_untitled()
assert (check_max_filename_untitled_result == false)
 
-- Render type
setRenderType #crop
check_max_render_type_result = check_max_render_type()
assert (check_max_render_type_result == true) message: "Set the render type to #view"
fix_max_render_type()

check_max_render_type_result = check_max_render_type()
assert (check_max_render_type_result == true)