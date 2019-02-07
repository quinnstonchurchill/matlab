function [vgVolume, pgVolume, flavor] = getNicRatios(volume, vg)
    if nargin < 2
        vg = 0.5;
    end
    
    % base percentages
    pg = 1 - vg;
    f = 0.2;
    nic = 0.8;
    
    vgVolume = vg*nic*volume;
    pgVolume = pg*nic*volume;
    flavor = f*volume;
    
    fprintf('VG Volume: %f mL\nPG Volume: %f mL\nFlavor Volume: %f mL\n',vgVolume, pgVolume, flavor);
end