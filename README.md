# Second-Counter
I Created a program where the number on a 7-segment display increments by 1 every second.  
Written in Verilog.  
Constraints file copied and modified from https://github.com/Digilent/digilent-xdc/blob/master/Basys-3-Master.xdc  

# FILE HIERARCHY

Second-Counter/  
├── sources/  
│   ├── display.v  
│   ├── clock_divider.v  
│   ├── number_counter.v  
│   └── display_map_7seg.v  
├── constraints/  
│   └── Basys3_Master.xdc  
└── README.md  

#   MODULE HIERARCHY  

display (display.v)  
├── count : number_counting (number_counter.v)  
│   ├── ones : display_map_7seg (display_map_7seg.v)  
│   ├── tens : display_map_7seg (display_map_7seg.v)  
│   ├── hundreds : display_map_7seg (display_map_7seg.v)  
│   └── thousands : display_map_7seg (display_map_7seg.v)   
└── one_Hz : clock_divider (clock_divider.v)  
 
    

