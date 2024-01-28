shader_type canvas_item;

uniform float min_value;
uniform float max_value;

float get_hue(vec4 color) {
	float min_val = min(min(color.r, color.g), color.b);
	float max_val = max(max(color.r, color.g), color.b);
	
	if(min_val == max_val) {
		return 0.0;
	}
	
	float hue = 0.0;
	
	if(max_val == color.r) {
		hue = (color.g - color.b) / (max_val - min_val);
	} else if(max_val == color.g) {
		hue = 2.0 + (color.b - color.r) / (max_val - min_val);
	} else {
		hue = 4.0 + (color.r - color.g) / (max_val - min_val);
	}
	
	hue = hue * 60.0;
	if(hue < 0.0) hue += 360.0;
	
	return hue;
}

void fragment() {
	vec4 current_texture = texture(TEXTURE, UV);
	float red = clamp(current_texture.r, min_value, max_value);
	float green = clamp(current_texture.g, min_value, max_value);
	float blue = clamp(current_texture.b, min_value, max_value);
	COLOR = vec4(red, green, blue,1);
}



//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
