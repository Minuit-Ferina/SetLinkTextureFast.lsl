# **SetLinkTextureFast.lsl**

A utility script written in **Linden Scripting Language (LSL)** for setting textures on linked prims in Second Life. This function updates the texture of a specified face or all faces of a prim, ensuring that existing texture parameters such as repeats, offsets, and rotation are preserved.

## **Attribution**

The code for this script was originally found on the [Second Life Wiki – llSetLinkTexture (SetLinkTextureFast)](https://wiki.secondlife.com/wiki/LlSetLinkTexture#SetLinkTextureFast).

## **Features**

- **Sets textures on linked prims**:
  - Allows updating textures on a specific face or all faces of a linked prim.
  - Preserves existing texture parameters (**repeats**, **offsets**, and **rotation**) for each face.
- **Handles multi-face texture applications**:
  - When applying a texture to all sides, it adjusts each face individually to maintain specific texture parameters.

## **Usage Example**

```lsl
// Apply a new texture to all faces of the second linked prim
SetLinkTextureFast(2, "uuid-of-new-texture", ALL_SIDES);

// Apply a new texture to face 1 of the second linked prim
SetLinkTextureFast(2, "uuid-of-new-texture", 1);
```

## **Function Description**

### **SetLinkTextureFast**

```lsl
SetLinkTextureFast(integer link, string texture, integer face)
```

Applies a new texture to a specified face or all faces of a linked prim, while preserving the existing texture parameters.

- **Parameters**:
  - `link`: The link number of the prim to be updated.
  - `texture`: The texture UUID to apply.
  - `face`: The face to apply the texture to. Use `ALL_SIDES` to apply the texture to all faces.
