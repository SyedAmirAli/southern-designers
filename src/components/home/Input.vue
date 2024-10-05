<template>
    <div class="flex flex-col w-full gap-0.5">
        <label :for="name" class="font-bold font-comfortaa">
            {{ title }}
        </label>
        <input
            type="text"
            :name="name"
            :id="name"
            v-model="inputValue"
            :placeholder="placeholder"
            class="border border-solid font-comfortaa px-3 py-2 border-slate-300 rounded-md focus:outline-primary-main text-slate-900" />
    </div>
</template>
<script setup>
    import { ref, watch } from 'vue';

    const props = defineProps({
        modelValue: { type: [String, Number], default: '' }, // Use modelValue for v-model binding
        name: { type: String, required: true },
        title: { type: String, required: true },
        placeholder: { type: String, default: 'Lorem Ipsum' },
    });

    const emit = defineEmits(['update:modelValue']); // Emit update:modelValue for v-model

    // Create a local copy of modelValue for two-way binding with v-model
    const inputValue = ref(props.modelValue);

    // Emit the update when the local inputValue changes
    watch(inputValue, (newValue) => {
        emit('update:modelValue', newValue);
    });

    // Update the local inputValue if the modelValue prop changes
    watch(
        () => props.modelValue,
        (newValue) => {
            inputValue.value = newValue;
        }
    );
</script>
