// This contains parameters, etc that all shaders have available
// All shaders should include this
#include "common.hlsl"

#define Strength Constants0.x 
#define LuminMin Constants0.y 
#define LuminMax Constants0.z 

// entry point
float4 main( PS_INPUT i ) : COLOR
{
    float2 uv = i.uv;

	float4 colorFB   = tex2D( TexBase, uv );
	float4 colorDirt = tex2D( Tex1,    uv );

    float luminance = calcLuminance( colorFB.rgb );
    
    float amount = smoothstep( LuminMin, LuminMax, luminance ) * Strength;
    
    return colorFB + colorDirt * amount;
}
