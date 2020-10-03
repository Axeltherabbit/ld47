shader_type canvas_item;
render_mode blend_mix;


uniform sampler2D noise;
uniform int Samples = 8; //MUST BE A MULTIPLE OF 2


// source https://www.youtube.com/watch?v=qDT-nJXmfL0
//	Directional Blur Shader
// Adapted from https://www.shadertoy.com/view/ldBXWG

vec4 DirectionalBlur(in vec2 uv, in vec2 MotionVector, in sampler2D Texture)
{
    vec4 Color = vec4(0.0);  
    float Noise = texture(noise,uv*20.0).x-0.485;
 
    for (int i=1; i<=Samples/2; i++)
    {
	Color += texture(Texture,uv+ (float(i)*MotionVector ) /float(Samples/2)*Noise*2.0);
	Color += texture(Texture,uv- (float(i)*MotionVector ) /float(Samples/2)*Noise*2.0);
    }    
    return Color/(float(Samples));    
}


void fragment(){
	float angle_degrees = sin(TIME);
	float strength = cos(TIME/10.);
	vec2 blur_vector = vec2(cos(radians(angle_degrees)),sin(radians(angle_degrees)))*strength;
	COLOR=DirectionalBlur(UV, blur_vector*strength, TEXTURE);
	
}