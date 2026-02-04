module allen_key_handle(
    key_sizes=[1.5, 6, 2, 5.5, 2.5, 5, 3, 4], 
    key_labels=[/*1.5, "six"*/], 
    handle_length=55, 
    handle_diameter=25, 
    tolerance=0.5, 
    slot_depth=32, 
    text_size=4.5, 
    alternate=true){
    
    num_faces = len(key_sizes);
    angle_step = 360 / num_faces;
    label_h=0.5;
    difference(){
        cylinder(h=handle_length, d=handle_diameter, $fn=num_faces);
        for(i = [0 : num_faces - 1]){
            odd_mult = alternate ? (i+1)%2 : 1;
            even_mult = alternate ? i%2 : 0; 
            key_size = key_sizes[i];
            key_d = key_size/cos(30) + tolerance;
            key_label = len(key_labels) > i ? str(key_labels[i]) : str(key_size);
            slot_w = key_d;
            slot_h = handle_length*0.6;
            angle = angle_step * (i+0.5);
            face_dist = handle_diameter*cos(angle_step/2);
            label_z = even_mult*slot_h + (handle_length - slot_h)/2;
            slot_z = odd_mult*(handle_length - slot_h + 2);
            wall = 0.8;
            rotate([0, 0, angle]) translate([0, face_dist/2, -1]) {
                translate([0, -key_d/2-wall, 0]) cylinder(h=handle_length+2, d=key_d, $fn=6);
                translate([0, -wall+slot_w/2, slot_z + slot_h/2]) cube([slot_w, slot_w*2, slot_h], center=true);
                translate([0, -label_h*0.95, label_z]) rotate([-90, 90, 0]) linear_extrude(height=label_h) text(key_label, size=text_size, halign="center", valign="center");
            }
        }
    }
    
}


alen_key_handle();

//translate([0, 30, 0]) alen_key_handle(key_labels=["1 1/2", "six", "two", "5 1/2", "2 1/2", /*"five", "three", "four"*/], alternate=false); 

