extern number glowIntensity;  // Adjust the glow intensity from Lua

vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords) {
    // Sample the original pixel color
    vec4 originalColor = Texel(texture, texture_coords);
    
    // Calculate the glow color by sampling nearby pixels
    vec4 glowColor = vec4(0.0);
    float sampleSize = 0.025;  // Adjust this value for the blur radius

    for (float dx = -1.5; dx <= 1.5; dx += 1.0) {
        for (float dy = -1.5; dy <= 1.5; dy += 1.0) {
            glowColor += Texel(texture, texture_coords + vec2(dx, dy) * sampleSize);
        }
    }

    // Normalize the glow color and apply intensity
    glowColor /= 13.0;  // Adjust this value based on the number of samples
    glowColor *= glowIntensity;

    // Add the original color and the glow color
    vec4 finalColor = originalColor + glowColor;
    
    return finalColor;
}