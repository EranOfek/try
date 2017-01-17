function startup(AddRem,ComputerPath)
%--------------------------------------------------------------------------
% startup function                                                  matlab
% Description: matlab startup function and set the matlab default behaviour.
%              This is including randomizing the seed of the matlab random
%              number generator and setting the figures font defaults.
% Input  : - Add or remove the astronomy & astrophysics matlab packages to
%            the matlab path {1 - for add|0 - for remove}. Default is 1 (add).
%          - Root Directory (check code for default).
% Output : null
% Tested : Matlab R2011a
%     By : Eran O. Ofek                    Sep 1996
%    URL : http://weizmann.ac.il/home/eofek/matlab/
% Example: startup('n'); % remove from the matlab path variable.
%--------------------------------------------------------------------------

%MyDefPath = '/home/astro-sw/shared/matlab';  %--- EDIT MyDefPath if needed ---
MyDefPath = '/Users/orlyg/eran/matlab';  %--- EDIT MyDefPath if needed ---

RunStartup = true;  % set to false if you want to avoid running this file

if (RunStartup),

    Def.AddRem   = true;
    %--- The User matlab directory ---
    ProgPath = which(mfilename);
    Istr = strfind(ProgPath,mfilename);
    ProgPath = ProgPath(1:Istr-2);
    
    try
        [~,UserName]=system('echo $USER');
        if (numel(UserName)<4),
            UserName = [];
        end
    catch
        UserName = [];
    end
            
    switch lower(UserName(1:4))
        case 'eran'
            Def.ComputerPath = ProgPath;
        otherwise
            Def.ComputerPath = MyDefPath;
    end

    %--- EDIT ProgPath if needed ---
    % This should contain the location of your matlab directories
    %-------------------------------



    if (nargin==0),
        AddRem = Def.AddRem;
        ComputerPath = Def.ComputerPath;
    elseif (nargin==1),
        ComputerPath = Def.ComputerPath;
    else
        % do nothing
    end


    % create FunPar directory to store default function parameters values
    % Default par dir is: '~/matlab/.FunPars'
    DirPAR      = sprintf('~%smatlab%s.FunPars',filesep,filesep);  % EDIT IF YOU WANT TO CHANGE PAR directory
    % create par dir if needed
    if (exist(DirPAR,'dir')==0),
        mkdir(DirPAR);
    end


    % add additional directories if .private file exist
    % this is for my own personal directories
    if (exist(sprintf('%s%s%s',ComputerPath,filesep,'.private'))),
        Private = 1;
    else
        Private = 0;
    end

    % function directories
    I = 1;       Add2path{I} = '/fun/AstroMap';
    I = I + 1;   Add2path{I} = '/fun/AstroSpec';
    I = I + 1;   Add2path{I} = '/fun/AstroStat';
    I = I + 1;   Add2path{I} = '/fun/AuxFiles';
    I = I + 1;   Add2path{I} = '/fun/Catalogue';
    I = I + 1;   Add2path{I} = '/fun/cosmology';
    I = I + 1;   Add2path{I} = '/fun/ds9';
    I = I + 1;   Add2path{I} = '/fun/EB';
    I = I + 1;   Add2path{I} = '/fun/ephem';
    I = I + 1;   Add2path{I} = '/fun/FITS';
    I = I + 1;   Add2path{I} = '/fun/FitFun';
    I = I + 1;   Add2path{I} = '/fun/GALEX';
    I = I + 1;   Add2path{I} = '/fun/General';
    I = I + 1;   Add2path{I} = '/fun/Geom';
    I = I + 1;   Add2path{I} = '/fun/glens';
    I = I + 1;   Add2path{I} = '/fun/htm';
    I = I + 1;   Add2path{I} = '/fun/ImAstrom';
    I = I + 1;   Add2path{I} = '/fun/ImBasic';
    I = I + 1;   Add2path{I} = '/fun/ImBasicOld';
    I = I + 1;   Add2path{I} = '/fun/ImPhot';
    I = I + 1;   Add2path{I} = '/fun/ImSpec';
    I = I + 1;   Add2path{I} = '/fun/ImSub';
    I = I + 1;   Add2path{I} = '/fun/Kepler';
    I = I + 1;   Add2path{I} = '/fun/microlensing';
    I = I + 1;   Add2path{I} = '/fun/Optics';
    I = I + 1;   Add2path{I} = '/fun/plotting';
    I = I + 1;   Add2path{I} = '/fun/radio';
    I = I + 1;   Add2path{I} = '/fun/sdss';
    I = I + 1;   Add2path{I} = '/fun/timeseries';
    I = I + 1;   Add2path{I} = '/fun/Swift';
    I = I + 1;   Add2path{I} = '/fun/www';
    
    I = I + 1;   Add2path{I} = '/fun/external';  % mathworks file exchange 
    
    % class directory
    I = I + 1;   Add2path{I} = '/fun/class'; 
    I = I + 1;   Add2path{I} = '/fun/statclass'; 

    % data directories
    I = I + 1;   Add2path{I} = '/data/AtmosphericExtinction';
    I = I + 1;   Add2path{I} = '/data/BATSE_LC';
    I = I + 1;   Add2path{I} = '/data/ELP';
    I = I + 1;   Add2path{I} = '/data/Filters';
    I = I + 1;   Add2path{I} = '/data/GAIA_SpecTemplates';
    I = I + 1;   Add2path{I} = '/data/GalacticExtinction';
    I = I + 1;   Add2path{I} = '/data/GALEX';
    I = I + 1;   Add2path{I} = '/data/General';
    I = I + 1;   Add2path{I} = '/data/KinneyGalSpec';
    I = I + 1;   Add2path{I} = '/data/PicklesStellarSpec';
    I = I + 1;   Add2path{I} = '/data/SDSS';
    I = I + 1;   Add2path{I} = '/data/SDSS/SDSS_htm/DR10';
    I = I + 1;   Add2path{I} = '/data/SolarSystem';
    I = I + 1;   Add2path{I} = '/data/SpecLines';
    I = I + 1;   Add2path{I} = '/data/SpecQSO';
    I = I + 1;   Add2path{I} = '/data/SpecRed';
    I = I + 1;   Add2path{I} = '/data/StellarTracks';
    I = I + 1;   Add2path{I} = '/data/VSOPE87';
    I = I + 1;   Add2path{I} = '/data/UCAC4';
    I = I + 1;   Add2path{I} = '/data/PTF';
    
    I = I + 1;   Add2path{I} = '/data/APASS';
    I = I + 1;   Add2path{I} = '/data/PS1';
    

    if (Private),
        I = I + 1;        Add2path{I} = '/fun/ptf';
        I = I + 1;        Add2path{I} = '/fun/SEDM';
        I = I + 1;        Add2path{I} = '/fun/LIM';
        I = I + 1;        Add2path{I} = '/fun/Others/mathworks/arrow';
        I = I + 1;        Add2path{I} = '/fun/Others/mathworks/kdtree/kdtree';


        % data directories
        I = I + 1;        Add2path{I} = '/data/private/BATSE_TTE';
        I = I + 1;        Add2path{I} = '/data/private/General';
        I = I + 1;        Add2path{I} = '/data/private/IPN';
        I = I + 1;        Add2path{I} = '/data/private/KonusWind';
        I = I + 1;        Add2path{I} = '/data/private/PTF';
        I = I + 1;        Add2path{I} = '/data/private/SDSS';
    else
        % do nothing
    end

    for I=1:1:length(Add2path),
       Add2path{I} = sprintf('%s%s',ComputerPath,Add2path{I});
    end
    % add parameters directory to path
    Add2path {end+1} = DirPAR;

    if (AddRem)
        % add
        addpath(Add2path{:});

        % randomizing the seed of the matlab random number generator
        rand('state',sum(100*clock));

        % Assign variables to the matlab workspace
        assignin('base','RAD',180./pi);    % Radian

        % all constants
        %[~,~,~,C]=get_constant('au','cgs');
        %assignin('base','C',C);    

        set(0,'DefaultAxesFontSize',14);
        set(0,'DefaultAxesFontName','times');

        format short g

      

    else
        % remove from matlab path
         rmpath(Add2path{:});

    end

end


