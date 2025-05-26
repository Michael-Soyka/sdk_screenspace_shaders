#include "common_vs.hlsl"

VS_OUTPUT main( const VS_INPUT v )
{
    float4 vProjPos = mul( float4( v.pos.xyz, 1.f ), cModelViewProj );

    int2 iGridRes = int2( 240, 320 );
	
    float4 vertex = vProjPos;

    vertex.xyz = vProjPos.xyz / vProjPos.w;
    vertex.xy  = floor( iGridRes * vertex.xy ) / iGridRes;
    vertex.xyz *= vProjPos.w;
	
    if ( vertex.w > 0 )
        vertex /= vertex.w;

    vProjPos = vertex;
   
    VS_OUTPUT o = ( VS_OUTPUT )0;
        o.projPos = vProjPos;
        o.uv      = v.uv;
        o.color   = v.color;

    return o;
}