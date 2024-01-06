import numpy as np
import matplotlib.pyplot as plt

def modulated_signal(fm_index):
    # Parametry sygnału
    A = 1.0  # Amplituda sygnału
    f_c = 1000.0  # Częstotliwość nośna
    f_m = 50.0  # Częstotliwość sygnału modulującego
    duration = 0.1  # Czas trwania sygnału

    # Czas
    t = np.linspace(0, duration, int(1000 * duration), endpoint=False)

    # Sygnał modulujący
    m_t = np.sin(2 * np.pi * f_m * t)

    # Sygnał modulowany FM
    beta = fm_index
    x_t = A * np.cos(2 * np.pi * f_c * t + beta * m_t)

    return t, m_t, x_t

# Rysowanie sygnałów dla różnych wartości beta
beta_values = [0.1, 1.0, 5.0]

plt.figure(figsize=(12, 8))

for i, beta in enumerate(beta_values, 1):
    t, m_t, x_t = modulated_signal(beta)

    plt.subplot(len(beta_values), 1, i)
    plt.plot(t, m_t, label='Modulating Signal')
    plt.plot(t, x_t, label=f'FM Modulated Signal (Beta={beta})')
    plt.title(f'Modulation with Beta={beta}')
    plt.xlabel('Time')
    plt.legend()

plt.tight_layout()
plt.show()