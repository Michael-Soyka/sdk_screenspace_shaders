#ifndef __COMMON_HLSL__
#define __COMMON_HLSL__

/* Texture samplers
 *  $basetexture
 *  $texture1
 *  $texture2
 *  $texture3
 */
sampler TexBase : register( s0 );
sampler Tex1    : register( s1 );
sampler Tex2    : register( s2 );
sampler Tex3    : register( s3 ); 

/* Texure's normalized dimensions
 *  ( x = 1.0 / width, y = 1.0 / height )
 *  WARNING: NOT AVAILABLE IN L4D2/PORTAL 2
 */
float2 TexBaseSize : register( c4 );
float2 Tex1Size    : register( c5 );
float2 Tex2Size    : register( c6 );
float2 Tex3Size    : register( c7 );

/* Custom params
 *  $c0
 *  $c1
 *  $c2
 *  $c3
 *  $c4 - ONLY AVAILABLE IN L4D2/PORTAL2
 */
const float4 Constants0 : register( c0 );
const float4 Constants1 : register( c1 );
const float4 Constants2 : register( c2 );
const float4 Constants3 : register( c3 );
const float4 Constants4 : register( c4 );

/* Eye position in world coordinates
 *  WARNING: this is calculated from the view matrix
 *  on a screen overlay, this will return near-zero values
 *  use PlayerPosition VMT proxy as a workaround
 */
const float4 EyePosition : register( c10 );

// xyz will be 0, 0, 0 (black) if mesh is rendered without fog
const float4 FogColor    : register( c29 );
// range of compressed depth buffer. usually 1.0 / 192
#define DepthRange         FogColor.w 

const float4 HDRParams   : register( c30 );
// exposure scale (bounded by tonemap controller's min/max)
#define TonemapScale       HDRParams.x
// 16 in HDR, 4.59479 in LDR
#define LightmapScale      HDRParams.y
// 16 in HDR, 1 in LDR
#define EnvmapScale        HDRParams.z
// gamma, equivalent to pow(TonemapScale, 1.0 / 2.2)
#define GammaScale         HDRParams.w

struct PS_INPUT
{
    float2 pos          : VPOS;
    float2 uv           : TEXCOORD0;
    float4 color        : TEXCOORD1;
};

#include "functions.hlsl"

#endif // __COMMON_HLSL__