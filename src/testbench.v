`timescale 1ns / 1ps

initial begin
  $dumpfile("wave.vcd");
  $dumpvars(0, testbench);
end


module tb_mini_light_up_game;

    // Signaux d'entrée (reg dans le testbench)
    reg clk;
    reg reset;
    reg btn;

    // Signaux de sortie (wire dans le testbench)
    wire [6:0] segments;
    wire [3:0] digit_sel;

    // Instanciation de votre module
    mini_light_up_game uut (
        .clk(clk),
        .reset(reset),
        .btn(btn),
        .segments(segments),
        .digit_sel(digit_sel)
    );

    // Génération de l'horloge (période de 10ns = 100MHz)
    always #5 clk = ~clk;

    initial begin
        // --- Initialisation ---
        clk = 0;
        reset = 1;
        btn = 0;

        // Attente et relâchement du reset
        #20 reset = 0;
        $display("Sortie du reset...");

        // --- Test 1 : Observer le registre circulaire ---
        // On laisse le curseur tourner quelques cycles
        #100;

        // --- Test 2 : Premier appui bouton (Afficheur 1) ---
        // Le joueur tente de bloquer un segment
        $display("Appui bouton - Afficheur 1");
        btn = 1;
        #20; // Maintenir l'appui
        btn = 0;
        
        #200; // Laisser le temps au système de traiter

        // --- Test 3 : Deuxième appui bouton (Afficheur 2) ---
        $display("Appui bouton - Afficheur 2");
        btn = 1;
        #20;
        btn = 0;

        // --- Test 4 : Observer le multiplexage ---
        // On attend assez longtemps pour voir digit_sel changer (balayage)
        $display("Observation du balayage des afficheurs...");
        #1000;

        $display("Fin de la simulation");
        $finish;
    end

    // Visualisation des signaux dans la console (optionnel)
    initial begin
        $monitor("Temps=%0t | Digit_Sel=%b | Segments=%b | Cursor=%b", 
                 $time, digit_sel, segments, uut.cursor);
    end

endmodule