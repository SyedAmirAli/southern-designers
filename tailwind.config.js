/** @type {import('tailwindcss').Config} */
export default {
    content: ['./index.html', './src/**/*.{vue,js,ts,jsx,tsx}'],
    theme: {
        extend: {
            colors: {
                // primary: 'var(--primary-color)',
                primary: '#0b8f42',
                // light: '#fff',
            },
        },
    },
    plugins: [],
};
