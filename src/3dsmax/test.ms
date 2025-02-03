fileIn "./helper.ms"
fileIn "./main.ms"

-- Untitled filename
resetMaxFile #noPrompt
assert (check_max_filename_untitled() == false)
 
-- Render type
setRenderType #crop
assert (check_max_render_type() == false)
fix_max_render_type()
assert (check_max_render_type() == true)