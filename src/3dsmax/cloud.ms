/*
 * Supported renderer
 * Check if the renderer is V-Ray or Corona (CPU-based renderers only)
 */
fn check_max_supportedRenderer=
(
    if (isCorona()) then 
	(
		return true
	)
	else if (isVray() and ((findstring (classof renderers.current as string) "V_Ray_GPU" == undefined) and (findstring (classof renderers.current as string) "V_Ray_RT" == undefined))) then
	(
		return true
	)
	
	return false
)

/*
 * V-Ray denoiser CPU
 * Check if V-Ray denoiser is disabled or set to CPU-based (not CUDA/OptiX)
 */
fn check_max_vray_denoiser=
(
    if (isVray()) do
    (
        re = maxOps.GetCurRenderElementMgr()
		if (re.getElementsActive() == true) do 
		(
			for i = 0 to (re.NumRenderElements() - 1) do
			(
				local element = re.GetRenderElement i
				if (classof element as string == "VRayDenoiser" and element.denoising_engine == 1) do 
				(
					return false 
				)
			)
			
			return true
		)
    )
)

/*
 * Corona denoiser CPU
 * Check if Corona denoiser is using CPU-based denoising
 */
fn check_max_corona_denoiser=
(
    if (isCorona()) do
    (
        return renderers.current.denoise_filterType != 4 -- denoise_filterType: 4 = NVIDIA AI (GPU)
    )
)

/*
 * Pre/Post Render scripts
 * Check if pre and post render script execution is disabled
 */
fn check_max_renderScript=
(
    return usePostRendScript == false and postRendScript == "" and usePreRendScript == false and preRendScript == ""
)

/*
 * V-Ray infinite render
 * Check if V-Ray doesn't have unlimited render time
 */
fn check_max_vray_infiniteRender=
(
    if (isVray() and renderers.current.imageSampler_type_new == 1) do
    (
        -- At least one limit must be set (not 0 which means unlimited)
        return renderers.current.progressive_max_render_time > 0 or renderers.current.progressive_noise_threshold > 0
    )
)

/*
 * Corona infinite render
 * Check if Corona has render limits set (pass, time, or noise)
 */
fn check_max_corona_infiniteRender=
(
    if (isCorona()) do
    (
        return renderers.current.progressive_passLimit != 0 or renderers.current.progressive_timeLimit != 0 or renderers.current.adaptivity_targetError != 0.0
    )
)