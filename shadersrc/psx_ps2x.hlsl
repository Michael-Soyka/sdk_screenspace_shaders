#include "common.hlsl"

float4 main( PS_INPUT i ) : COLOR
{
    float2 UV = i.uv;

    float4 baseTexture = tex2D( TexBase, UV );

    return float4( baseTexture.rgb, 1.0f );
}