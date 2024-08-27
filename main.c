#include <stdint.h>
#include <stdio.h>
#include <string.h>

// Функция для байтсвапа 32-битного числа
uint32_t byteSwap32(uint32_t value) {
    return ((value >> 24) & 0x000000FF) |  // Шаг 1: Сдвигаем старший байт в младший байт
           ((value >> 8) & 0x0000FF00) |  // Шаг 2: Сдвигаем второй байт в третий байт
           ((value << 8) & 0x00FF0000) |  // Шаг 3: Сдвигаем третий байт в второй байт
           ((value << 24) & 0xFF000000);  // Шаг 4: Сдвигаем младший байт в старший байт
}

// Функция для объединения двух 16-битных значений в один float
float getFloatFromTwo16Bit(uint16_t value1, uint16_t value2) {
    uint32_t combinedValue =
        (value1 << 16) | value2;  // Объединяем два 16-битных значения в одно 32-битное
    combinedValue = byteSwap32(combinedValue);  // Выполняем байтсвап для 32-битного значения
    float floatValue;

    memcpy(&floatValue, &combinedValue,
           sizeof(float));  // Преобразуем 32-битное значение в float

    return floatValue;
}

// Массивы для хранения значений с каждого датчика
uint16_t nap_bat[2] = {248, 26432};  // Заряд батареи

uint16_t vibroScorost_X[2] = {44557, 3648};  // Скорость вибрации по оси X
uint16_t vibroScorost_Y[2] = {65, 63295};    // Скорость вибрации по оси Y
uint16_t vibroScorost_Z[2] = {832, 3136};    // Скорость вибрации по оси Z

uint16_t vibroPerem_X[2] = {20164, 62016};  // Текущая вибрация по оси X
uint16_t vibroPerem_Y[2] = {6449, 17729};   // Текущая вибрация по оси Y
uint16_t vibroPerem_Z[2] = {25174, 59456};  // Текущая вибрация по оси Z

int main() {
    // Пример использования для заряда батареи
    float Nap_bat_charge = getFloatFromTwo16Bit(nap_bat[0], nap_bat[1]);
    printf("Заряд батареи: %.1f В\n", Nap_bat_charge);

    // Пример использования для скорости вибрации по оси X
    float vibroScorostX = getFloatFromTwo16Bit(vibroScorost_X[0], vibroScorost_X[1]);
    printf("Скорость вибрации по оси X: %.1f\n", vibroScorostX);

    // Пример использования для скорости вибрации по оси Y
    float vibroScorostY = getFloatFromTwo16Bit(vibroScorost_Y[0], vibroScorost_Y[1]);
    printf("Скорость вибрации по оси Y: %.1f\n", vibroScorostY);

    // Пример использования для скорости вибрации по оси Z
    float vibroScorostZ = getFloatFromTwo16Bit(vibroScorost_Z[0], vibroScorost_Z[1]);
    printf("Скорость вибрации по оси Z: %.1f\n", vibroScorostZ);

    // Пример использования для текущей вибрации по оси X
    float vibroPeremX = getFloatFromTwo16Bit(vibroPerem_X[0], vibroPerem_X[1]);
    printf("Текущая вибрация по оси X: %.1f\n", vibroPeremX);

    // Пример использования для текущей вибрации по оси Y
    float vibroPeremY = getFloatFromTwo16Bit(vibroPerem_Y[0], vibroPerem_Y[1]);
    printf("Текущая вибрация по оси Y: %.1f\n", vibroPeremY);

    // Пример использования для текущей вибрации по оси Z
    float vibroPeremZ = getFloatFromTwo16Bit(vibroPerem_Z[0], vibroPerem_Z[1]);
    printf("Текущая вибрация по оси Z: %.1f\n", vibroPeremZ);

    return 0;
}
