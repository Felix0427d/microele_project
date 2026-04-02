module mini_light_up_game (
    input clk,           // Horloge système
    input reset,         // Reset du jeu
    input btn,           // Bouton du joueur [cite: 4, 18]
    output [6:0] segments, // Sortie vers le bus segments commun 
    output [3:0] digit_sel // Sélection de l'afficheur (Anodes/Cathodes)
);

    // --- 1. Traitement du bouton (Anti-rebond / Impulsion unique) ---
    // [cite: 19, 20]
    reg btn_prev;
    wire btn_pulse;
    always @(posedge clk) btn_prev <= btn;
    assign btn_pulse = btn && !btn_prev;

    // --- 2. Registre Circulaire (Curseur) ---
    // [cite: 13, 14]
    reg [5:0] cursor;
    always @(posedge clk) begin
        if (reset) cursor <= 6'b000001;
        else cursor <= {cursor[4:0], cursor[5]}; // Décalage circulaire
    end

    // --- 3. Mémoire des 4 Afficheurs ---
    // Chaque afficheur a sa propre mémoire de 7 segments [cite: 21, 22]
    reg [6:0] mem [3:0]; 
    reg [1:0] active_digit; // Index de l'afficheur que le joueur tente de remplir

    always @(posedge clk) begin
        if (reset) begin
            active_digit <= 0;
            mem[0] <= 7'b0; mem[1] <= 7'b0; mem[2] <= 7'b0; mem[3] <= 7'b0;
        end else if (btn_pulse) begin
            // On "bloque" la position du curseur dans la mémoire de l'afficheur actif [cite: 8, 23]
            // Note: Le curseur ici active un segment spécifique pour former le '0'
            mem[active_digit] <= mem[active_digit] | {1'b0, cursor}; 
            
            // Si l'afficheur actuel est complet (ou après l'appui), on passe au suivant
            if (active_digit < 3) active_digit <= active_digit + 1;
        end
    end

    // --- 4. Multiplexage d'Affichage ---
    // Un compteur rapide pour basculer entre les afficheurs (Persistance rétinienne)
    reg [15:0] refresh_counter; 
    always @(posedge clk) refresh_counter <= refresh_counter + 1;

    wire [1:0] scan_idx = refresh_counter[15:14]; // Vitesse de balayage

    // Décodage pour activer un seul afficheur à la fois
    assign digit_sel = (scan_idx == 2'b00) ? 4'b1110 :
                       (scan_idx == 2'b01) ? 4'b1101 :
                       (scan_idx == 2'b10) ? 4'b1011 : 4'b0111;

    // Envoi de la mémoire correspondante sur le bus commun 
    assign segments = mem[scan_idx];

endmodule