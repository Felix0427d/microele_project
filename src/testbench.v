`timescale 1ns / 1ps

module tb_mini_light_up_game;

    // =========================
    // Signaux
    // =========================
    reg clk;
    reg reset;
    reg btn;

    wire [6:0] seg0, seg1, seg2, seg3;

    // =========================
    // DUT (Device Under Test)
    // =========================
    mini_light_up_game uut (
        .clk(clk),
        .reset(reset),
        .btn(btn),
        .seg0(seg0),
        .seg1(seg1),
        .seg2(seg2),
        .seg3(seg3)
    );

    // =========================
    // Horloge (40 MHz — CLOCK_PERIOD = 25 ns)
    // =========================
    always #12.5 clk = ~clk;

    // Tâche utilitaire : impulsion bouton d'1 cycle
    task press_btn;
        begin
            @(negedge clk);
            btn = 1;
            @(negedge clk);
            btn = 0;
        end
    endtask

    // =========================
    // Dump VCD (GTKWave)
    // =========================
    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_mini_light_up_game);
        $dumpvars(1, uut);
    end

    // =========================
    // Stimuli
    // =========================
    initial begin
        // Init
        clk   = 0;
        reset = 1;
        btn   = 0;

        // Reset (2 cycles)
        @(negedge clk); @(negedge clk);
        reset = 0;
        $display("t=%0t | Sortie du reset", $time);

        // Laisser le curseur tourner quelques cycles
        repeat(10) @(negedge clk);

        // --- Digit 0 : verrouiller les 6 segments un par un ---
        $display("t=%0t | Remplissage digit 0", $time);
        repeat(6) begin
            press_btn;
            repeat(6) @(negedge clk); // laisser le curseur avancer
        end

        // --- Digit 1 ---
        $display("t=%0t | Remplissage digit 1", $time);
        repeat(6) begin
            press_btn;
            repeat(6) @(negedge clk);
        end

        // --- Digit 2 ---
        $display("t=%0t | Remplissage digit 2", $time);
        repeat(6) begin
            press_btn;
            repeat(6) @(negedge clk);
        end

        // --- Digit 3 ---
        $display("t=%0t | Remplissage digit 3", $time);
        repeat(6) begin
            press_btn;
            repeat(6) @(negedge clk);
        end

        repeat(20) @(negedge clk);
        $display("t=%0t | Fin simulation", $time);
        $finish;
    end

    // =========================
    // Monitoring console
    // =========================
    initial begin
        $monitor("t=%0t | seg0=%7b seg1=%7b seg2=%7b seg3=%7b",
                 $time, seg0, seg1, seg2, seg3);
    end

endmodule