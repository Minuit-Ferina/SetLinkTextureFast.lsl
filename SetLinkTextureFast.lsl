/**
* found here: https://wiki.secondlife.com/wiki/LlSetLinkTexture
*/
/**
 * @brief Sets the texture of a specified face or all faces of a linked prim, preserving existing texture parameters.
 *
 * This function updates the texture of a specific face or all faces of a linked prim in Second Life. It preserves the current 
 * repeats, offsets, and rotation of the texture, ensuring that only the texture itself is changed. If applying the texture to 
 * all faces, the function adjusts each face individually to maintain their specific texture parameters.
 *
 * @param link The link number of the prim whose texture is to be updated.
 * @param texture The texture to apply to the specified face(s).
 * @param face The face to apply the texture to. Use ALL_SIDES to apply the texture to all faces.
 *
 * @note This function handles the intricacies of maintaining texture parameters while changing the texture. It uses a list 
 *       stride of 4 elements (texture, repeats, offsets, angle) from llGetLinkPrimitiveParams and updates it accordingly.
 *
 * @example
 * // Example usage:
 * SetLinkTextureFast(2, "uuid-of-new-texture", ALL_SIDES);
 *
 * @sideeffects
 * - Modifies the texture of the specified face(s), which might affect the appearance of the prim.
 * - Involves multiple list operations, which may impact performance if used on a large number of prims or faces.
 */
SetLinkTextureFast(integer link, string texture, integer face)
{
    // Obtain the current texture parameters and replace the texture only.
    // If we are going to apply the texture to ALL_SIDES, we need
    // to adjust the returned parameters in a loop, so that each face
    // keeps its current repeats, offsets and rotation.
    list Params = llGetLinkPrimitiveParams(link, [PRIM_TEXTURE, face]);
    integer idx;
    face *= face > 0; // Make it zero if it was ALL_SIDES
    // This part is tricky. The list returned by llGLPP has a 4 element stride
    // (texture, repeats, offsets, angle). But as we modify it, we add two
    // elements to each, so the completed part of the list has 6 elements per
    // stride.
    integer NumSides = llGetListLength(Params) / 4; // At this point, 4 elements per stride
    for (idx = 0; idx < NumSides; ++idx)
    {
        // The part we've completed has 6 elements per stride, thus the *6.
        Params = llListReplaceList(Params, [PRIM_TEXTURE, face++, texture], idx*6, idx*6);
    }
    llSetLinkPrimitiveParamsFast(link, Params);
}
