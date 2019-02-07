clear;clc;

while true
    fprintf('Available movies today:\n')
    A = fprintf('A) 12 Strong   1)2:30   2)4:40  3)7:50  4)10:50\n');
    B = fprintf('B) Coco        1)12:40  2)3:45\n');
    C = fprintf('C) The Post    1)12:45  2)3:35  3)7:05  4)9:55\n');
    errorMsg = 'Invalid option; please restart app...\n';
    
    MC = input('Movie choice:  ', 's');
    ST = input('Showtime:      ');

    after2pm = ST >= 2;

    % validate movie choice
    if (MC ~= 'A' && MC ~= 'B' && MC ~= 'C') || isnumeric(ST) == false || ST < 1
        fprintf(errorMsg)
        break
    end

    AT = input('Adult tickets: ');
    CT = input('Kid tickets:   ');
    totalTickets = AT + CT;

    if totalTickets > 30
        fprintf(errorMsg)
        break
    else
        if after2pm
            totalCost = AT * 12.45 + CT * 9.68;
        else
            totalCost = AT * 11.17 + CT * 8;
        end

        fprintf('Total cost:    $%.2f\n', totalCost)
        break
    end
end