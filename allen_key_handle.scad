module allen_key_handle(
    key_sizes=[1.5, 6, 2, 5.5, 2.5, 5, 3, 4],
    center_key_size = false, 
    key_labels=[/*1.5, "6mm"*/], 
    length=65, 
    diameter=25, 
    tolerance=0.2, 
    slot_depth=32, 
    text_size=4.5, 
    wall=1.2,
    key_faces=6,
    alternate=false){
    
    num_faces = len(key_sizes);
    angle_step = 360 / num_faces;
    label_h=0.5;
    difference(){
        rotate([0, 0, 0]) cylinder(h=length, d=diameter, $fn=num_faces);
//        if (center_key_size){
//                translate([0, 0, -1]) cylinder(h=length+2, d=center_key_size+tolerance, $fn=key_faces);
//        }
        for(i = [0 : num_faces - 1]){
            odd_mult = alternate ? (i+1)%2 : 1;
            even_mult = alternate ? i%2 : 0; 
            key_size = key_sizes[i];
            real_tol = tolerance;// < key_size*0.1 ? tolerance : key_size*0.1;
            real_key_size = key_size/cos(30) + real_tol;
            key_label = len(key_labels) > i ? str(key_labels[i]) : str(key_size);
            slot_w = real_key_size;
            slot_h = length*0.6;
            angle = angle_step * i;
            face_dist = diameter*cos(angle_step/2);
            label_z = even_mult*slot_h + (length - slot_h)/2;
            slot_z = odd_mult*(length - slot_h + 2);
            rotate([0, 0, -90+angle+angle_step/2]) translate([0, face_dist/2, -1]) {
                if (key_size){
                    translate([0, -real_key_size/2-wall, 0]) cylinder(h=length+2, d=real_key_size, $fn=key_faces);
                    translate([0, -wall+slot_w/2, slot_z + slot_h/2]) cube([slot_w, slot_w*2, slot_h], center=true);
                }
                translate([0, -label_h*0.6, label_z]) rotate([-90, 90, 0]) linear_extrude(height=label_h) text(key_label, size=text_size, halign="center", valign="center");
            }
        }
    }
    
    if (center_key_size){
            translate([0, diameter, -1]) cylinder(h=length+2, d=center_key_size/cos(30)+tolerance, $fn=key_faces);
    }
    
    
}



// daiso set
//allen_key_handle(key_sizes=[1.5, 6, 2, 5.5, 2.5, 5, 3, 4], key_labels=["1.5mm", "6mm", "2mm", "5.5mm", "2.5mm", "5mm", "3mm", "4mm"], alternate=false);

// example with custom labels. Missing labels will be key size casted to str
//translate([0, 30, 0]) allen_key_handle(key_labels=["1 1/2", "six", "two", "5 1/2", "2 1/2", /*"five", "three", "four"*/], alternate=false); 


// toolset short - center
//allen_key_handle(key_sizes=[1.5, 7, 2, 6, 2.5, 5.5, 3, 5, 4, 4.5], alternate=false, diameter=30, key_faces=12, tolerance=0.1, length=70);

// toolset short
allen_key_handle(
    key_sizes=[1.5, 7, 2, 6, 3, 4.5, 4, 5, 2.5, 5.5], 
    key_labels=["1.5mm", "7mm", "2mm", "6mm", "3mm", "4.5mm", "4mm", "5mm", "2.5mm", "5.5mm"], 
    alternate=true, 
    diameter=28, 
    key_faces=12, 
    tolerance=0.1, 
    length=60);
    
    

// toolset short w/center
//allen_key_handle(key_sizes=[1.5, 8, 2, 5, 2.5, 6, 3, 5.5, 4, 4.5], alternate=false, diameter=27, key_faces=12, tolerance=0.1, length=70);
//translate([0, 40, 0]) cylinder($fn=12, d=7/cos(30)+0.1, h=72);

// toolset long
//allen_key_handle(key_sizes=[1.5, 6, 2, 5, 2.5, 5.5, 3, 4, 4.5], alternate=false, diameter=24, key_faces=12, tolerance=0.1, length=80);

in=25.4;

// toolset sae short
// allen_key_handle(
//     key_sizes=[5/64*in, 3/16*in, 1/32*in, 1/4*in, 1/16*in, 7/32*in, 3/32*in, 1/8*in, 7/64*in, 5/32*in, 9/64*in], 
//     key_labels=["5/64", "3/16", "1/32", "1/4", "1/16", "7/32", "3/32", "1/8", "7/64", "5/32", "9/64"], 
//     alternate=false, 
//     diameter=27, 
//     key_faces=12, 
//     tolerance=0.1, 
//     length=50);


// toolset sae long
// allen_key_handle(
//     key_sizes=[1/4*in, 5/64*in, 7/32*in, 7/64*in, 9/64*in, 3/16*in, 1/8*in, 5/32*in, 3/32*in], 
//     key_labels=["1/4", "5/64", "7/32", "7/64", "9/64", "3/16", "1/8", "5/32", "3/32"], 
//     alternate=true, 
//     diameter=25, 
//     key_faces=12, 
//     tolerance=0.1, 
//     length=70);
