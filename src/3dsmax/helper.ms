/*
 * Additional helper functions for the sanity checks
 */

-- isVray
-- isCorona
-- isFStorm
-- getMaxVersion

fn openSaveDialog=
(
    --
)

fn getAllObjects=
(
    --
)

fn isVray=
(
    return findString (classOf renderers.current as string) "V_Ray" != undefined
)

fn isCorona=
(
    return findString (classOf renderers.current as string) "Corona" != undefined 
)

fn isFStorm=
(
	return findString (classOf renderers.current as string) "FStorm" != undefined
)

fn isArnold=
(
    return findString (classOf renderers.current as string) "Arnold" != undefined
)


