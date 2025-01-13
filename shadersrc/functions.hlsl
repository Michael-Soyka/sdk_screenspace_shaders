//Most common functions

float calcLuminance( float3 color )
{
    return dot( color, float3( .299, .587, .114 ) );
}