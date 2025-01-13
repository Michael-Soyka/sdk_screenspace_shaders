// Template shader that does nothing interesting

// This contains parameters, etc that all shaders have available
// All shaders should include this
#include "common.hlsl"

#define Strength Constants0.x 
#define LuminMin Constants0.y 
#define LuminMax Constants0.z 

float CalcLuminance( float3 color )
{
    return dot( color, float3( .299f, .587f, .114f ) );
}

// entry point
float4 main( PS_INPUT i ) : COLOR
{
    float2 UV = i.baseTexCoord.xy;

	float4 colorFB   = tex2D( TexBase, UV );
	float4 colorDirt = tex2D( Tex1,    UV );

    float luminance  = CalcLuminance( colorFB.rgb );
    
    float amount     = smoothstep( LuminMin, LuminMax, luminance ) * Strength;
    
    return colorFB + colorDirt * amount;
}
