switch test.name
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     

    case 'A00_01'
        
        test.dimension.length    = 20.67;        % unit: mm (default)  
        test.dimension.width     = 10.64;
        test.dimension.thickness = 4.43; 
        % -
        aramis2D.loadCFact       = 60;            % N/Volt  - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';    
        % -
        analise.stage            = 91; % SEL: stage
        % -
        IDinic                   = 20;
        IDfina                   = 150;
        % -
        P1                       = 1;
        P2                       = 100;
        
    case 'A00_02'
        
        test.dimension.length    = 20.67;        % unit: mm (default)  
        test.dimension.width     = 10.64;
        test.dimension.thickness = 4.43; 
        % -
        aramis2D.loadCFact       = 125;            % N/Volt - uptated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';
        % -
        IDinic                   = 50;
        IDfina                   = 250; 
        % -
        P1                       = 1;
        P2                       = 50;        
                
 case {'A00_03','A00_03_SelDICParam'}
        
        test.dimension.length    = 20.69;        % unit: mm (default)  
        test.dimension.width     = 10.61;
        test.dimension.thickness = 4.51; 
        % -
        aramis2D.loadCFact       = 125;            % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';
        % -
        analise.stage            = 32; % SEL: stage
        % -
        P1                       = 1;
        P2                       = 100;        
        
 case 'A00_04'
        
        test.dimension.length    = 20.54;        % unit: mm (default)  
        test.dimension.width     = 10.58;
        test.dimension.thickness = 4.54; 
        % -
        aramis2D.loadCFact       = 125;            % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';
        % -
        analise.stage            = 41; % SEL: stage 
        % -
        P1                       = 1;
        P2                       = 80;        
        
 case 'A00_05'
        
        test.dimension.length    = 20.50;        % unit: mm (default)  
        test.dimension.width     = 10.60;
        test.dimension.thickness = 4.46; 
        % -
        aramis2D.loadCFact       = 125;            % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';   
        % -
        analise.stage            = 27; % SEL: stage 
        % -
        P1                       = 1;
        P2                       = 60;        
       
 case 'A00_06'
        
        test.dimension.length    = 20.63;        % unit: mm (default)  
        test.dimension.width     = 10.64;
        test.dimension.thickness = 	4.51; 
        % -
        aramis2D.loadCFact       = 125;            % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';
        % -
        P1                       = 1;
        P2                       = 80;        
                
case 'A00_07'
        
        test.dimension.length    = 20.64;        % unit: mm (default)  
        test.dimension.width     = 10.61;
        test.dimension.thickness = 4.51; 
        % -
        aramis2D.loadCFact       = 125;            % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';
        % -
        P1                       = 1;
        P2                       = 60;        
        
 case 'A00_08'
        
        test.dimension.length    = 20.68;        % unit: mm (default)  
        test.dimension.width     = 10.64;
        test.dimension.thickness = 4.49; 
        % -
        aramis2D.loadCFact       = 125;            % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon'; 
        % -
        P1                       = 1;
        P2                       = 60;        
        
 case 'A00_09'
        
        test.dimension.length    = 20.72;        % unit: mm (default)  
        test.dimension.width     = 10.61;
        test.dimension.thickness = 4.49; 
        % -
        aramis2D.loadCFact       = 125;            % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';
        % -
        P1                       = 1;
        P2                       = 60;        
                
 case 'A00_10'
        
        test.dimension.length    = 20.60;        % unit: mm (default)  
        test.dimension.width     = 10.60;
        test.dimension.thickness = 4.53;
        % -
        MatchID.dispCFact       = 5;             % mm/Volt
        % -
        MatchID.frecAq.Instron  = 10;            % Hz
        MatchID.frecAq.MatchID   = 1;   
        % -
        test.lens                = 'Nikkon'; 
        % -
        P1                       = 1;
        P2                       = 60;        
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                
        
 case 'A05_01'
        
        test.dimension.length    = 20.53;        % unit: mm (default)  
        test.dimension.width     = 10.62;
        test.dimension.thickness = 4.63;
        % -
        aramis2D.image.X         = 48;           % pixel
        aramis2D.image.Y         = 238;
        aramis2D.image.width     = 1528;
        aramis2D.image.height    = 785;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 120;            % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon'; 
        % -
        P1                       = 1;
        P2                       = 65;         
        
 case 'A05_02'
        
        test.dimension.length    = 20.63;        % unit: mm (default)  
        test.dimension.width     = 10.57;
        test.dimension.thickness = 4.60; 
        % -
        aramis2D.image.X         = 49;           % pixel
        aramis2D.image.Y         = 224;
        aramis2D.image.width     = 1531;
        aramis2D.image.height    = 789;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 120;           % N/Volt - update
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';  
        % -
        P1                       = 1;
        P2                       = 60;         
        
 case 'A05_03'
        
        test.dimension.length    = 20.59;        % unit: mm (default)  
        test.dimension.width     = 10.63;
        test.dimension.thickness = 4.60; 
        % -
        aramis2D.image.X         = 52;           % pixel
        aramis2D.image.Y         = 215;
        aramis2D.image.width     = 1532;
        aramis2D.image.height    = 804;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 120;           % N/Volt - update
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';     
        % -
        P1                       = 1;
        P2                       = 70;         
        
 case 'A05_04'
        
        test.dimension.length    = 20.48;        % unit: mm (default)  
        test.dimension.width     = 10.58;
        test.dimension.thickness = 4.62; 
        % -
        aramis2D.image.X         = 39;           % pixel
        aramis2D.image.Y         = 208;
        aramis2D.image.width     = 1518;
        aramis2D.image.height    = 797;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 120;           % N/Volt - update
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';     
        % -
        P1                       = 1;
        P2                       = 100;         
        
 case 'A05_05'
        
        test.dimension.length    = 20.63;        % unit: mm (default)  
        test.dimension.width     = 10.61;
        test.dimension.thickness = 4.65; 
        % -
        aramis2D.image.X         = 45;           % pixel
        aramis2D.image.Y         = 215;
        aramis2D.image.width     = 1540;
        aramis2D.image.height    = 794;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 120;           % N/Volt - update
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';      
        % -
        P1                       = 1;
        P2                       = 100;         
        
 case 'A05_06'
        
        test.dimension.length    = 20.62;        % unit: mm (default)  
        test.dimension.width     = 10.67;
        test.dimension.thickness = 4.62; 
        % -
        aramis2D.image.X         = 53;           % pixel
        aramis2D.image.Y         = 215;
        aramis2D.image.width     = 1529;
        aramis2D.image.height    = 806;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 120;           % N/Volt - update
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';       
        % -
        P1                       = 1;
        P2                       = 90;         
        
case 'A05_07'
        
        test.dimension.length    = 20.58;        % unit: mm (default)  
        test.dimension.width     = 10.60;
        test.dimension.thickness = 4.65; 
        % -
        aramis2D.image.X         = 40;           % pixel
        aramis2D.image.Y         = 218;
        aramis2D.image.width     = 1541;
        aramis2D.image.height    = 789;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 120;           % N/Volt - update
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';       
        % -
        P1                       = 1;
        P2                       = 80;         
        
 case 'A05_08'
        
        test.dimension.length    = 20.55;        % unit: mm (default)  
        test.dimension.width     = 10.57;
        test.dimension.thickness = 4.68; 
        % -
        aramis2D.image.X         = 49;           % pixel
        aramis2D.image.Y         = 213;
        aramis2D.image.width     = 1518;
        aramis2D.image.height    = 792;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 120;           % N/Volt - update
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';       
        % -
        P1                       = 1;
        P2                       = 80;         

case 'A05_09'
        
        test.dimension.length    = 20.69;        % unit: mm (default)  
        test.dimension.width     = 10.59;
        test.dimension.thickness = 4.67; 
        % -
        aramis2D.image.X         = 34;           % pixel
        aramis2D.image.Y         = 211;
        aramis2D.image.width     = 1534;
        aramis2D.image.height    = 796;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 120;           % N/Volt - update
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';              
        % -
        P1                       = 1;
        P2                       = 80;         
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 case 'A10_01'
        
        test.dimension.length    = 20.57;        % unit: mm (default)  
        test.dimension.width     = 10.09;
        test.dimension.thickness = 4.55; 
        % -
        aramis2D.image.X         = 85;           % pixel
        aramis2D.image.Y         = 243;
        aramis2D.image.width     = 1493;
        aramis2D.image.height    = 740;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 150;           % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon'; 
        % -
        P1                       = 1;
        P2                       = 70;         

 case 'A10_02'
        
        test.dimension.length    = 20.57;        % unit: mm (default)  
        test.dimension.width     = 10.02;
        test.dimension.thickness = 4.55; 
        % -
        aramis2D.image.X         = 76;           % pixel
        aramis2D.image.Y         = 250;
        aramis2D.image.width     = 1513;
        aramis2D.image.height    = 744;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 150;           % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';        
        % -
        P1                       = 1;
        P2                       = 90;         
                
case 'A10_03'
        
        test.dimension.length    = 20.60;        % unit: mm (default)  
        test.dimension.width     = 10.03;
        test.dimension.thickness = 4.62; 
        % -
        aramis2D.image.X         = 82;           % pixel
        aramis2D.image.Y         = 258;
        aramis2D.image.width     = 1506;
        aramis2D.image.height    = 739;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 150;           % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';                
        % -
        P1                       = 1;
        P2                       = 100;         
                
 case 'A10_04'
        
        test.dimension.length    = 20.58;        % unit: mm (default)  
        test.dimension.width     = 10.03;
        test.dimension.thickness = 4.61; 
        % -
        aramis2D.image.X         = 81;           % pixel
        aramis2D.image.Y         = 261;
        aramis2D.image.width     = 1511;
        aramis2D.image.height    = 744;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 150;           % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';        
        % -
        P1                       = 1;
        P2                       = 75;         
          
case 'A10_05'
        
        test.dimension.length    = 20.57;        % unit: mm (default)  
        test.dimension.width     = 10.00;
        test.dimension.thickness = 4.59; 
        % -
        aramis2D.image.X         = 77;           % pixel
        aramis2D.image.Y         = 260;
        aramis2D.image.width     = 1514;
        aramis2D.image.height    = 747;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 150;           % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';                      
        % -
        P1                       = 1;
        P2                       = 70;         
        
case 'A10_06'
        
        test.dimension.length    = 20.57;        % unit: mm (default)  
        test.dimension.width     = 10.00;
        test.dimension.thickness = 4.57; 
        % -
        aramis2D.image.X         = 88;           % pixel
        aramis2D.image.Y         = 249;
        aramis2D.image.width     = 1502;
        aramis2D.image.height    = 749;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 150;           % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';         
        % -
        P1                       = 1;
        P2                       = 70;         

case 'A10_07'
        
        test.dimension.length    = 20.65;        % unit: mm (default)  
        test.dimension.width     = 10.02;
        test.dimension.thickness = 4.60; 
        % -
        aramis2D.image.X         = 85;           % pixel
        aramis2D.image.Y         = 257;
        aramis2D.image.width     = 1512;
        aramis2D.image.height    = 739;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 150;           % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';          
        % -
        P1                       = 1;
        P2                       = 80;         
                
 case 'A10_08'
        
        test.dimension.length    = 20.59;        % unit: mm (default)  
        test.dimension.width     = 10.00;
        test.dimension.thickness = 4.61; 
        % -
        aramis2D.image.X         = 84;           % pixel
        aramis2D.image.Y         = 255;
        aramis2D.image.width     = 1510;
        aramis2D.image.height    = 747;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 150;           % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';       
        % -
        P1                       = 1;
        P2                       = 60;         
                
 case 'A10_09'
        
        test.dimension.length    = 20.62;        % unit: mm (default)  
        test.dimension.width     = 10.00;
        test.dimension.thickness = 4.65; 
        % -
        aramis2D.image.X         = 75;           % pixel
        aramis2D.image.Y         = 262;
        aramis2D.image.width     = 1521;
        aramis2D.image.height    = 741;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 150;           % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';         
        % -
        P1                       = 1;
        P2                       = 60;         
                
case 'A10_10'
        
        test.dimension.length    = 20.54;        % unit: mm (default)  
        test.dimension.width     = 9.99;
        test.dimension.thickness = 4.59; 
        % -
        aramis2D.image.X         = 84;           % pixel
        aramis2D.image.Y         = 248;
        aramis2D.image.width     = 1502;
        aramis2D.image.height    = 741;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 150;           % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';        
        % -
        P1                       = 1;
        P2                       = 70;         

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%        
                
 case 'A20_01'
        
        test.dimension.length    = 20.49;        % unit: mm (default)  
        test.dimension.width     = 10.05;
        test.dimension.thickness = 4.18; 
        % -
        aramis2D.image.X         = 84;           % pixel
        aramis2D.image.Y         = 247;
        aramis2D.image.width     = 1498;
        aramis2D.image.height    = 742;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 165;           % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';          
        % -
        analise.stage            = 27; % SEL: stage             
        % -
        P1                       = 1;
        P2                       = 90;         
        
 case 'A20_02'
        
        test.dimension.length    = 20.57;        % unit: mm (default)  
        test.dimension.width     = 10.18;
        test.dimension.thickness = 4.23; 
        % -
        aramis2D.image.X         = 73;           % pixel
        aramis2D.image.Y         = 256;
        aramis2D.image.width     = 1513;
        aramis2D.image.height    = 738;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 165;           % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';        
        % -
        analise.stage            = 33; % SEL: stage                   
        % -
        P1                       = 1;
        P2                       = 100;         
        
 case 'A20_03'
        
        test.dimension.length    = 20.52;        % unit: mm (default)  
        test.dimension.width     = 10.12;
        test.dimension.thickness = 4.25; 
        % -
        aramis2D.image.X         = 75;           % pixel
        aramis2D.image.Y         = 259;
        aramis2D.image.width     = 1512;
        aramis2D.image.height    = 729;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 165;           % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';        
        % -
        P1                       = 1;
        P2                       = 85;         
        
case 'A20_04'
        
        test.dimension.length    = 20.56;        % unit: mm (default)  
        test.dimension.width     = 10.04;
        test.dimension.thickness = 4.26; 
        % -
        aramis2D.image.X         = 86;           % pixel
        aramis2D.image.Y         = 247;
        aramis2D.image.width     = 1502;
        aramis2D.image.height    = 747;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 165;           % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';          
        % -
        P1                       = 1;
        P2                       = 105;         
        
case 'A20_05'
        
        test.dimension.length    = 20.52;        % unit: mm (default)  
        test.dimension.width     = 10.04;
        test.dimension.thickness = 4.26; 
        % -
        aramis2D.image.X         = 77;           % pixel
        aramis2D.image.Y         = 264;
        aramis2D.image.width     = 1509;
        aramis2D.image.height    = 741;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 165;           % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';                
        % -
        P1                       = 1;
        P2                       = 90;         
        
case 'A20_06'
        
        test.dimension.length    = 20.54;        % unit: mm (default)  
        test.dimension.width     = 10.05;
        test.dimension.thickness = 4.23; 
        % -
        aramis2D.image.X         = 82;           % pixel
        aramis2D.image.Y         = 279;
        aramis2D.image.width     = 1493;
        aramis2D.image.height    = 742;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 165;           % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';          
        % -
        P1                       = 1;
        P2                       = 115;         

case 'A20_07'
        
        test.dimension.length    = 20.54;        % unit: mm (default)  
        test.dimension.width     = 10.05;
        test.dimension.thickness = 4.31; 
        % -
        aramis2D.image.X         = 85;           % pixel
        aramis2D.image.Y         = 265;
        aramis2D.image.width     = 1493;
        aramis2D.image.height    = 746;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 165;           % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';        
        % -
        P1                       = 1;
        P2                       = 110;         
  
case 'A20_08'
        
        test.dimension.length    = 20.50;        % unit: mm (default)  
        test.dimension.width     = 10.05;
        test.dimension.thickness = 4.28; 
        % -
        aramis2D.image.X         = 80;           % pixel
        aramis2D.image.Y         = 266;
        aramis2D.image.width     = 1498;
        aramis2D.image.height    = 735;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 165;           % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';                  
        % -
        P1                       = 1;
        P2                       = 100;         
        
case 'A20_09'
        
        test.dimension.length    = 20.63;        % unit: mm (default)  
        test.dimension.width     = 10.03;
        test.dimension.thickness = 4.30; 
        % -
        aramis2D.image.X         = 81;           % pixel
        aramis2D.image.Y         = 248;
        aramis2D.image.width     = 1496;
        aramis2D.image.height    = 745;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 165;           % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';                
        % -
        P1                       = 1;
        P2                       = 100;         
        
case 'A20_10'
        
        test.dimension.length    = 20.51;        % unit: mm (default)  
        test.dimension.width     = 10.03;
        test.dimension.thickness = 4.30; 
        % -
        aramis2D.image.X         = 78;           % pixel
        aramis2D.image.Y         = 258;
        aramis2D.image.width     = 1498;
        aramis2D.image.height    = 735;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 165;           % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';                
        % -
        P1                       = 1;
        P2                       = 90;         
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

case 'A40_01'
        
        test.dimension.length    = 20.49;        % unit: mm (default)  
        test.dimension.width     = 10.19;
        test.dimension.thickness = 4.37; 
        % -
        aramis2D.image.X         = 46;           % pixel
        aramis2D.image.Y         = 271;
        aramis2D.image.width     = 1538;
        aramis2D.image.height    = 772;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 115;            % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';                   
        % -
        analise.stage            = 37; % SEL: stage        
        % -
        P1                       = 1;
        P2                       = 130;         
        
case 'A40_02'
        
        test.dimension.length    = 20.53;        % unit: mm (default)  
        test.dimension.width     = 10.15;
        test.dimension.thickness = 4.38; 
        % -
        aramis2D.image.X         = 42;           % pixel
        aramis2D.image.Y         = 273;
        aramis2D.image.width     = 1565;
        aramis2D.image.height    = 771;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 115;            % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';                   
        % -
        P1                       = 1;
        P2                       = 150;         
                
case 'A40_03'
        
        test.dimension.length    = 20.51;        % unit: mm (default)  
        test.dimension.width     = 10.12;
        test.dimension.thickness = 4.42; 
        % -
        aramis2D.image.X         = 40;           % pixel
        aramis2D.image.Y         = 282;
        aramis2D.image.width     = 1559;
        aramis2D.image.height    = 773;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 115;            % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';         
        % -
        P1                       = 1;
        P2                       = 135;                 
        
case 'A40_04'
        
        test.dimension.length    = 20.52;        % unit: mm (default)  
        test.dimension.width     = 10.16;
        test.dimension.thickness = 4.43; 
        % -
        aramis2D.image.X         = 34;           % pixel
        aramis2D.image.Y         = 286;
        aramis2D.image.width     = 1559;
        aramis2D.image.height    = 751;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 115;            % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';                              
        % -
        P1                       = 1;
        P2                       = 140;         
        
case 'A40_05'
        
        test.dimension.length    = 20.50;        % unit: mm (default)  
        test.dimension.width     = 10.14;
        test.dimension.thickness = 4.43; 
        % -
        aramis2D.image.X         = 46;           % pixel
        aramis2D.image.Y         = 280;
        aramis2D.image.width     = 1551;
        aramis2D.image.height    = 755;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 115;            % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';             
        % -
        P1                       = 1;
        P2                       = 120;         
                
case 'A40_06'
        
        test.dimension.length    = 20.53;        % unit: mm (default)  
        test.dimension.width     = 10.14;
        test.dimension.thickness = 3.69; 
        % -
        aramis2D.image.X         = 34;           % pixel
        aramis2D.image.Y         = 272;
        aramis2D.image.width     = 1560;
        aramis2D.image.height    = 771;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 115;            % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';             
        % -
        P1                       = 1;
        P2                       = 140;         
                
case 'A40_07'
        
        test.dimension.length    = 20.54;        % unit: mm (default)  
        test.dimension.width     = 10.10;
        test.dimension.thickness = 4.39; 
        % -
        aramis2D.image.X         = 36;           % pixel
        aramis2D.image.Y         = 285;
        aramis2D.image.width     = 1569;
        aramis2D.image.height    = 780;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 115;            % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';              
        % -
        P1                       = 1;
        P2                       = 160;                 
        
case 'A40_08'
        
        test.dimension.length    = 20.53;        % unit: mm (default)  
        test.dimension.width     = 10.10;
        test.dimension.thickness = 4.43; 
        % -
        aramis2D.image.X         = 43;           % pixel
        aramis2D.image.Y         = 279;
        aramis2D.image.width     = 1563;
        aramis2D.image.height    = 780;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 115;            % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';              
        % -
        P1                       = 1;
        P2                       = 160;         
                        
case 'A40_09'
        
        test.dimension.length    = 20.55;        % unit: mm (default)  
        test.dimension.width     = 10.10;
        test.dimension.thickness = 4.42; 
        % -
        aramis2D.image.X         = 24;           % pixel
        aramis2D.image.Y         = 269;
        aramis2D.image.width     = 1582;
        aramis2D.image.height    = 778;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 115;            % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';                 
        % -
        P1                       = 1;
        P2                       = 160;         
        
case 'A40_10'
        
        test.dimension.length    = 20.53;        % unit: mm (default)  
        test.dimension.width     = 10.12;
        test.dimension.thickness = 4.40; 
        % -
        aramis2D.image.X         = 21;           % pixel
        aramis2D.image.Y         = 294;
        aramis2D.image.width     = 1565;
        aramis2D.image.height    = 762;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 115;            % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';              
        % -
        P1                       = 1;
        P2                       = 140;         
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%        
        
case 'A50_01'
        
        test.dimension.length    = 20.45;        % unit: mm (default)  
        test.dimension.width     = 10.14;
        test.dimension.thickness = 4.63; 
        % -
        aramis2D.image.X         = 26;           % pixel
        aramis2D.image.Y         = 302;
        aramis2D.image.width     = 1558;
        aramis2D.image.height    = 783;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 115;            % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';         
        % -
        P1                       = 1;
        P2                       = 140;         
                
case 'A50_02'
        
        test.dimension.length    = 20.45;        % unit: mm (default)  
        test.dimension.width     = 10.12;
        test.dimension.thickness = 4.62; 
        % -
        aramis2D.image.X         = 21;           % pixel
        aramis2D.image.Y         = 294;
        aramis2D.image.width     = 1565;
        aramis2D.image.height    = 780;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 115;            % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';           
        % -
        P1                       = 1;
        P2                       = 120;         
                
case 'A50_03'
        
        test.dimension.length    = 20.46;        % unit: mm (default)  
        test.dimension.width     = 10.11;
        test.dimension.thickness = 5.98; 
        % -
        aramis2D.image.X         = 23;           % pixel
        aramis2D.image.Y         = 292;
        aramis2D.image.width     = 1559;
        aramis2D.image.height    = 758;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 115;            % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';                   
        % -
        P1                       = 1; 
        P2                       = 125;         
        
case 'A50_04'
        
        test.dimension.length    = 20.44;        % unit: mm (default)  
        test.dimension.width     = 10.11;
        test.dimension.thickness = 4.62; 
        % -
        aramis2D.image.X         = 21;           % pixel
        aramis2D.image.Y         = 314;
        aramis2D.image.width     = 1566;
        aramis2D.image.height    = 744;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 115;            % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';                   
        % -
        P1                       = 1;
        P2                       = 135;         
        
case 'A50_05'
        
        test.dimension.length    = 20.45;        % unit: mm (default)  
        test.dimension.width     = 10.15;
        test.dimension.thickness = 4.52; 
        % -
        aramis2D.image.X         = 17;           % pixel
        aramis2D.image.Y         = 304;
        aramis2D.image.width     = 1554;
        aramis2D.image.height    = 755;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 115;            % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';           
        % -
        P1                       = 1;
        P2                       = 178;         
                
case 'A50_06'
        
        test.dimension.length    = 20.48;        % unit: mm (default)  
        test.dimension.width     = 10.04;
        test.dimension.thickness = 4.56; 
        % -
        aramis2D.image.X         = 16;           % pixel
        aramis2D.image.Y         = 294;
        aramis2D.image.width     = 1556;
        aramis2D.image.height    = 771;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 115;            % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';         
        % -
        P1                       = 1;
        P2                       = 50;         
                
case 'A50_07'
        
        test.dimension.length    = 20.44;        % unit: mm (default)  
        test.dimension.width     = 10.04;
        test.dimension.thickness = 4.58; 
        % -
        aramis2D.image.X         = 1;           % pixel
        aramis2D.image.Y         = 1;
        aramis2D.image.width     = 1624;
        aramis2D.image.height    = 1232;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 115;            % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';         
        % -
        P1                       = 1;
        P2                       = 178;         
                
case 'A50_08'
        
        test.dimension.length    = 20.49;        % unit: mm (default)  
        test.dimension.width     = 10.11;
        test.dimension.thickness = 4.58; 
        % -
        aramis2D.image.X         = 8;           % pixel
        aramis2D.image.Y         = 296;
        aramis2D.image.width     = 1570;
        aramis2D.image.height    = 746;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 115;            % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';                 
        % -
        P1                       = 1;
        P2                       = 140;         
        
case 'A50_09'
        
        test.dimension.length    = 20.51;        % unit: mm (default)  
        test.dimension.width     = 10.21;
        test.dimension.thickness = 4.52; 
        % -
        aramis2D.image.X         = 18;           % pixel
        aramis2D.image.Y         = 296;
        aramis2D.image.width     = 1567;
        aramis2D.image.height    = 769;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 115;            % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';         
        % -
        P1                       = 1;
        P2                       = 165;         
                
case 'A50_10'
        
        test.dimension.length    = 20.51;        % unit: mm (default)  
        test.dimension.width     = 10.13;
        test.dimension.thickness = 4.59; 
        % -
        aramis2D.image.X         = 17;           % pixel
        aramis2D.image.Y         = 305;
        aramis2D.image.width     = 1561;
        aramis2D.image.height    = 746;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 115;            % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';         
        % -
        P1                       = 1;
        P2                       = 135;         
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

case 'A60_01'
        
        test.dimension.length    = 20.69;        % unit: mm (default)  
        test.dimension.width     = 8.80;
        test.dimension.thickness = 4.25; 
        % -
        aramis2D.image.X         = 13;           % pixel
        aramis2D.image.Y         = 377;
        aramis2D.image.width     = 1586;
        aramis2D.image.height    = 661;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 110;           % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';         
        % -
        P1                       = 1;
        P2                       = 178;         
                
case 'A60_02'
        
        test.dimension.length    = 20.79;        % unit: mm (default)  
        test.dimension.width     = 8.67;
        test.dimension.thickness = 4.06; 
        % -
        aramis2D.image.X         = 30;           % pixel
        aramis2D.image.Y         = 410;
        aramis2D.image.width     = 1567;
        aramis2D.image.height    = 639;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 110;           % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';                
        % -
        P1                       = 1;
        P2                       = 178;         
        
case 'A60_03'
        
        test.dimension.length    = 20.74;        % unit: mm (default)  
        test.dimension.width     = 8.62;
        test.dimension.thickness = 3.86; 
        % -
        aramis2D.image.X         = 23;           % pixel
        aramis2D.image.Y         = 390;
        aramis2D.image.width     = 1569;
        aramis2D.image.height    = 637;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 110;           % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';        
        % -
        P1                       = 1;
        P2                       = 178;         
                
case 'A60_04'
        
        test.dimension.length    = 20.77;        % unit: mm (default)  
        test.dimension.width     = 8.68;
        test.dimension.thickness = 3.64; 
        % -
        aramis2D.image.X         = 16;           % pixel
        aramis2D.image.Y         = 387;
        aramis2D.image.width     = 1583;
        aramis2D.image.height    = 634;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 110;           % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';                
        % -
        P1                       = 1;
        P2                       = 178;         
        
case 'A60_05'
        
        test.dimension.length    = 20.77;        % unit: mm (default)  
        test.dimension.width     = 8.71;
        test.dimension.thickness = 4.02; 
        % -
        aramis2D.image.X         = 14;           % pixel
        aramis2D.image.Y         = 382;
        aramis2D.image.width     = 1598;
        aramis2D.image.height    = 655;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 110;           % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';        
        % -
        P1                       = 1;
        P2                       = 178;         
                
case 'A60_06'
        
        test.dimension.length    = 20.81;        % unit: mm (default)  
        test.dimension.width     = 8.77;
        test.dimension.thickness = 3.83; 
        % -
        aramis2D.image.X         = 17;           % pixel
        aramis2D.image.Y         = 384;
        aramis2D.image.width     = 1576;
        aramis2D.image.height    = 643;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 110;           % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';        
        % -
        P1                       = 1;
        P2                       = 178;         
                
case 'A60_07'
        
        test.dimension.length    = 20.74;        % unit: mm (default)  
        test.dimension.width     = 8.83;
        test.dimension.thickness = 4.18; 
        % -
        aramis2D.image.X         = 10;           % pixel
        aramis2D.image.Y         = 384;
        aramis2D.image.width     = 1578;
        aramis2D.image.height    = 663;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 110;           % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';        
        % -
        P1                       = 1;
        P2                       = 165;         
                
case 'A60_08'
        
        test.dimension.length    = 20.76;        % unit: mm (default)  
        test.dimension.width     = 8.77;
        test.dimension.thickness = 4.01; 
        % -
        aramis2D.image.X         = 11;           % pixel
        aramis2D.image.Y         = 384;
        aramis2D.image.width     = 1563;
        aramis2D.image.height    = 659;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 110;           % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';        
        % -
        P1                       = 1;
        P2                       = 178;         
                
case 'A60_09'
        
        test.dimension.length    = 20.71;        % unit: mm (default)  
        test.dimension.width     = 8.78;
        test.dimension.thickness = 3.86; 
        % -
        aramis2D.image.X         = 11;           % pixel
        aramis2D.image.Y         = 370;
        aramis2D.image.width     = 159;
        aramis2D.image.height    = 656;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 110;           % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';        
        % -
        P1                       = 1;
        P2                       = 178;         
                
case 'A60_10'
        
        test.dimension.length    = 20.86;        % unit: mm (default)  
        test.dimension.width     = 8.79;
        test.dimension.thickness = 3.65; 
        % -
        aramis2D.loadCFact       = 110;           % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';        
        % -
        P1                       = 1;
        P2                       = 178;         
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

case 'A70_01'
        
        test.dimension.length    = 20.77;        % unit: mm (default)  
        test.dimension.width     = 9.53;
        test.dimension.thickness = 2.81; 
        % -
        aramis2D.image.X         = 17;           % pixel
        aramis2D.image.Y         = 333;
        aramis2D.image.width     = 1569;
        aramis2D.image.height    = 727;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 110;           % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';        
        % -
        P1                       = 1;
        P2                       = 178;         
                
 case 'A70_02'
        
        test.dimension.length    = 20.70;        % unit: mm (default)  
        test.dimension.width     = 9.50;
        test.dimension.thickness = 2.89; 
        % -
        aramis2D.image.X         = 10;           % pixel
        aramis2D.image.Y         = 337;
        aramis2D.image.width     = 1582;
        aramis2D.image.height    = 730;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 110;           % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';           
        % -
        P1                       = 1;
        P2                       = 178;         
                
case 'A70_03'
        
        test.dimension.length    = 20.80;        % unit: mm (default)  
        test.dimension.width     = 9.48;
        test.dimension.thickness = 2.92; 
        % -
        aramis2D.image.X         = 18;           % pixel
        aramis2D.image.Y         = 336;
        aramis2D.image.width     = 1576;
        aramis2D.image.height    = 727;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 110;           % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';            
        % -
        P1                       = 1;
        P2                       = 178;         
                
case 'A70_04'
        
        test.dimension.length    = 20.78;        % unit: mm (default)  
        test.dimension.width     = 9.43;
        test.dimension.thickness = 2.95; 
        % -
        aramis2D.image.X         = 20;           % pixel
        aramis2D.image.Y         = 334;
        aramis2D.image.width     = 1570;
        aramis2D.image.height    = 710;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 110;           % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';            
        % -
        P1                       = 1;
        P2                       = 178;         
                
case 'A70_05'
        
        test.dimension.length    = 20.76;        % unit: mm (default)  
        test.dimension.width     = 9.47;
        test.dimension.thickness = 2.94; 
        % -
        aramis2D.image.X         = 18;           % pixel
        aramis2D.image.Y         = 352;
        aramis2D.image.width     = 1573;
        aramis2D.image.height    = 714;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 110;           % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';            
        % -
        P1                       = 1;
        P2                       = 178;         
                
case 'A70_06'
        
        test.dimension.length    = 20.72;        % unit: mm (default)  
        test.dimension.width     = 9.44;
        test.dimension.thickness = 2.92; 
        % -
        aramis2D.image.X         = 32;           % pixel
        aramis2D.image.Y         = 342;
        aramis2D.image.width     = 1549;
        aramis2D.image.height    = 719;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 110;           % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';            
        % -
        P1                       = 1;
        P2                       = 178;         
                
 case 'A70_07'
        
        test.dimension.length    = 20.71;        % unit: mm (default)  
        test.dimension.width     = 9.40;
        test.dimension.thickness = 3.00; 
        % -
        aramis2D.image.X         = 20;           % pixel
        aramis2D.image.Y         = 326;
        aramis2D.image.width     = 1565;
        aramis2D.image.height    = 714;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 110;           % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';           
        % -
        P1                       = 1;
        P2                       = 178;         
                
case 'A70_08'
        
        test.dimension.length    = 20.69;        % unit: mm (default)  
        test.dimension.width     = 9.40;
        test.dimension.thickness = 3.04; 
        % -
        aramis2D.image.X         = 14;           % pixel
        aramis2D.image.Y         = 327;
        aramis2D.image.width     = 1576;
        aramis2D.image.height    = 717;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 110;           % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';                    
        % -
        P1                       = 1;
        P2                       = 119;         
        
case 'A70_09'
        
        test.dimension.length    = 20.84;        % unit: mm (default)  
        test.dimension.width     = 9.38;
        test.dimension.thickness = 3.06; 
        % -
        aramis2D.image.X         = 18;           % pixel
        aramis2D.image.Y         = 330;
        aramis2D.image.width     = 1567;
        aramis2D.image.height    = 708;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 110;           % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';                    
        % -
        P1                       = 1;
        P2                       = 178;         
        
case 'A70_10'
        
        test.dimension.length    = 20.73;        % unit: mm (default)  
        test.dimension.width     = 9.36;
        test.dimension.thickness = 3.05; 
        % -
        aramis2D.image.X         = 21;           % pixel
        aramis2D.image.Y         = 348;
        aramis2D.image.width     = 1563;
        aramis2D.image.height    = 719;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 110;           % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';            
        % -
        P1                       = 1;
        P2                       = 178;         

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

case 'A80_01'
        
        test.dimension.length    = 20.72;        % unit: mm (default)  
        test.dimension.width     = 9.50;
        test.dimension.thickness = 3.58; 
        % -
        aramis2D.image.X         = 10;           % pixel
        aramis2D.image.Y         = 340;
        aramis2D.image.width     = 1582;
        aramis2D.image.height    = 719;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 110;           % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';                   
        % -
        P1                       = 1;
        P2                       = 178;         
        
case 'A80_02'
        
        test.dimension.length    = 20.66;        % unit: mm (default)  
        test.dimension.width     = 9.46;
        test.dimension.thickness = 3.55; 
        % -
        aramis2D.image.X         = 7;           % pixel
        aramis2D.image.Y         = 349;
        aramis2D.image.width     = 1579;
        aramis2D.image.height    = 720;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 110;           % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';        
        % -
        P1                       = 1;
        P2                       = 158;         
                
case 'A80_03'
        
        test.dimension.length    = 20.68;        % unit: mm (default)  
        test.dimension.width     = 9.44;
        test.dimension.thickness = 3.55; 
        % -
        aramis2D.image.X         = 14;           % pixel
        aramis2D.image.Y         = 338;
        aramis2D.image.width     = 1576;
        aramis2D.image.height    = 724;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 110;           % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';        
        % -
        P1                       = 1;
        P2                       = 158;         
                
case 'A80_04'
        
        test.dimension.length    = 20.65;        % unit: mm (default)  
        test.dimension.width     = 9.44;
        test.dimension.thickness = 3.52; 
        % -
        aramis2D.image.X         = 18;           % pixel
        aramis2D.image.Y         = 334;
        aramis2D.image.width     = 1562;
        aramis2D.image.height    = 722;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 110;           % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';        
        % -
        P1                       = 1;
        P2                       = 158;         
                
case 'A80_05'
        
        test.dimension.length    = 20.68;        % unit: mm (default)  
        test.dimension.width     = 9.51;
        test.dimension.thickness = 3.48; 
        % -
        aramis2D.image.X         = 11;           % pixel
        aramis2D.image.Y         = 320;
        aramis2D.image.width     = 1584;
        aramis2D.image.height    = 734;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 110;           % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';        
        % -
        P1                       = 1;
        P2                       = 158;         
                
case 'A80_06'
        
        test.dimension.length    = 20.64;        % unit: mm (default)  
        test.dimension.width     = 9.45;
        test.dimension.thickness = 3.72; 
        % -
        aramis2D.image.X         = 17;           % pixel
        aramis2D.image.Y         = 339;
        aramis2D.image.width     = 1549;
        aramis2D.image.height    = 719;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 110;           % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';                     
        % -
        P1                       = 1;
        P2                       = 158;         
        
case 'A80_07'
        
        test.dimension.length    = 20.61;        % unit: mm (default)  
        test.dimension.width     = 9.42;
        test.dimension.thickness = 3.71; 
        % -
        aramis2D.image.X         = 13;           % pixel
        aramis2D.image.Y         = 339;
        aramis2D.image.width     = 1570;
        aramis2D.image.height    = 729;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 110;           % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';        
        % -
        P1                       = 1;
        P2                       = 158;         
                
case 'A80_08'
        
        test.dimension.length    = 20.70;        % unit: mm (default)  
        test.dimension.width     = 9.47;
        test.dimension.thickness = 3.70; 
        % -
        aramis2D.image.X         = 7;           % pixel
        aramis2D.image.Y         = 340;
        aramis2D.image.width     = 1570;
        aramis2D.image.height    = 716;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 110;           % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';        
        % -
        P1                       = 1;
        P2                       = 158;         
                
case 'A80_09'
        
        test.dimension.length    = 20.62;        % unit: mm (default)  
        test.dimension.width     = 9.44;
        test.dimension.thickness = 3.68; 
        % -
        aramis2D.image.X         = 20;           % pixel
        aramis2D.image.Y         = 340;
        aramis2D.image.width     = 1560;
        aramis2D.image.height    = 719;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 110;           % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';        
        % -
        P1                       = 1;
        P2                       = 158;         
                
case 'A80_10'
        
        test.dimension.length    = 20.72;        % unit: mm (default)  
        test.dimension.width     = 9.41;
        test.dimension.thickness = 3.63; 
        % -
        aramis2D.image.X         = 7;           % pixel
        aramis2D.image.Y         = 331;
        aramis2D.image.width     = 1591;
        aramis2D.image.height    = 729;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 110;           % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';        
        % -
        P1                       = 1;
        P2                       = 158;         
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%          
        
case 'A90_01'
        
        test.dimension.length    = 20.55;        % unit: mm (default)  
        test.dimension.width     = 10.76;
        test.dimension.thickness = 4.42; 
        % -
        aramis2D.image.X         = 89;           % pixel
        aramis2D.image.Y         = 204;
        aramis2D.image.width     = 1503;
        aramis2D.image.height    = 790;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 135;            % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';        
        % -
        P1                       = 1;
        P2                       = 178;         
        
case 'A90_02'
        
        test.dimension.length    = 20.70;        % unit: mm (default)  
        test.dimension.width     = 10.50;
        test.dimension.thickness = 4.40; 
        % -
        aramis2D.image.X         = 84;           % pixel
        aramis2D.image.Y         = 193;
        aramis2D.image.width     = 1505;
        aramis2D.image.height    = 781;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 135;            % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';          
        % -
        P1                       = 1;
        P2                       = 238;         
        
case 'A90_03'
        
        test.dimension.length    = 20.62;        % unit: mm (default)  
        test.dimension.width     = 10.79;
        test.dimension.thickness = 4.35; 
        % -
        aramis2D.image.X         = 83;           % pixel
        aramis2D.image.Y         = 193;
        aramis2D.image.width     = 1503;
        aramis2D.image.height    = 783;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 135;            % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';        
        % -
        P1                       = 1;
        P2                       = 238;         
 
case 'A90_04'
        
        test.dimension.length    = 20.60;        % unit: mm (default)  
        test.dimension.width     = 10.76;
        test.dimension.thickness = 4.31; 
        % -
        aramis2D.image.X         = 77;           % pixel
        aramis2D.image.Y         = 196;
        aramis2D.image.width     = 1512;
        aramis2D.image.height    = 796;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 135;            % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';              
        % -
        P1                       = 1;
        P2                       = 238;        
        
case 'A90_05'
        
        test.dimension.length    = 20.64;        % unit: mm (default)  
        test.dimension.width     = 10.75;
        test.dimension.thickness = 4.24; 
        % -
        aramis2D.image.X         = 72;           % pixel
        aramis2D.image.Y         = 191;
        aramis2D.image.width     = 1519;
        aramis2D.image.height    = 791;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 135;            % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';         
        % -
        P1                       = 1;
        P2                       = 238;         
        
case 'A90_06'
        
        test.dimension.length    = 20.54;        % unit: mm (default)  
        test.dimension.width     = 10.77;
        test.dimension.thickness = 4.30; 
        % -
        aramis2D.image.X         = 75;           % pixel
        aramis2D.image.Y         = 197;
        aramis2D.image.width     = 1511;
        aramis2D.image.height    = 796;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 135;            % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';           
        % -
        P1                       = 1;
        P2                       = 238;         
        
case 'A90_07'
        
        test.dimension.length    = 20.53;        % unit: mm (default)  
        test.dimension.width     = 10.78;
        test.dimension.thickness = 4.28; 
        % -
        aramis2D.image.X         = 71;           % pixel
        aramis2D.image.Y         = 189;
        aramis2D.image.width     = 1517;
        aramis2D.image.height    = 800;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 135;            % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';         
        % -
        P1                       = 1;
        P2                       = 238;         
                        
case 'A90_08'
        
        test.dimension.length    = 20.56;        % unit: mm (default)  
        test.dimension.width     = 10.75;
        test.dimension.thickness = 4.23; 
        % -
        aramis2D.image.X         = 71;           % pixel
        aramis2D.image.Y         = 172;
        aramis2D.image.width     = 1516;
        aramis2D.image.height    = 797;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 135;            % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';          
        % -
        P1                       = 1;
        P2                       = 238;         
                        
case 'A90_09'
        
        test.dimension.length    = 20.64;        % unit: mm (default)  
        test.dimension.width     = 10.77;
        test.dimension.thickness = 4.18; 
        % -
        aramis2D.image.X         = 69;           % pixel
        aramis2D.image.Y         = 199;
        aramis2D.image.width     = 1518;
        aramis2D.image.height    = 796;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 135;            % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';        
        % -
        P1                       = 1;
        P2                       = 238;                 
        
case 'A90_10'
        
        test.dimension.length    = 20.70;        % unit: mm (default)  
        test.dimension.width     = 10.77;
        test.dimension.thickness = 4.15; 
        % -
        aramis2D.image.X         = 75;           % pixel
        aramis2D.image.Y         = 187;
        aramis2D.image.width     = 1524;
        aramis2D.image.height    = 790;
        % -
        aramis2D.projp.fsize     = 19;            % pixel/subset
        aramis2D.projp.fstep     = 11;
        aramis2D.projp.tenssise  = 7;             % strain length
        % -
        aramis2D.loadCFact       = 135;            % N/Volt - updated
        aramis2D.dispCFact       = 5;             % mm/Volt
        % -
        aramis2D.frecAq.Instron  = 10;            % Hz
        aramis2D.frecAq.Aramis   = 1;   
        % -
        test.lens                = 'Nikkon';        
        % -
        P1                       = 1;
        P2                       = 238;         
                          
end

test.dimension.section = test.dimension.thickness*test.dimension.width;
        

