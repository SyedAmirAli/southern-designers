import { defineComponent, ref } from 'vue';
import { useRoute } from 'vue-router';

export default defineComponent({
    setup() {
        const { path } = useRoute();
        const isMobileMenu = ref(false);

        const toggleButton = () => {
            info('clicker');
            isMobileMenu.value = !isMobileMenu.value;
        };

        const navItem = [
            { id: 1, name: 'Home', href: '/', active: '/' === path },
            {
                id: 2,
                name: 'Product',
                href: '/product',
                active: '/product' === path,
            },
            { id: 3, name: 'Faq', href: '/faq', active: '/faq' === path },
            {
                id: 3,
                name: 'Profile',
                href: '/profile',
                active: '/profile' === path,
            },
            {
                id: 3,
                name: 'Certification',
                href: '/certification',
                active: '/certification' === path,
            },
            { id: 4, name: 'About', href: '/about', active: '/about' === path },
            {
                id: 5,
                name: 'Contact',
                href: '/contact',
                active: '/contact' === path,
            },
        ];

        return (
            <div class='fixed top-0 left-0 w-full z-10 flex items-center justify-center 2xl:bg-transparent border-solid border-slate-300 !bg-white border'>
                <header class='container flex justify-between items-center py-2 bg-transparent'>
                    <div class='logo'>
                        <img
                            src='https://greenlifebd.ctpse.info/uploads/1725991337-----logo.jpeg'
                            class='h-20'
                        />
                    </div>
                    <nav class=''>
                        <ul
                            class='flex lg:!flex gap-0 lg:gap-10 lg:items-center lg:justify-center text-lg font-semibold text-slate-700 absolute lg:static top-24 lg:bg-transparent bg-white z-20 p-6 lg:p-0 flex-col lg:flex-row -left-0 sm:w-full lg:w-auto border-b border-solid border-slate-300 lg:border-none w-[93%]'
                            style={{
                                display: isMobileMenu.value ? 'flex' : 'none',
                            }}>
                            {navItem.map((nav, i) => (
                                <li
                                    className={`group ${
                                        nav.active ? 'active' : ''
                                    }`}
                                    key={i}>
                                    <a
                                        href='/'
                                        class='duration-300 lg:hover:text-primary hover:bg-primary hover:text-slate-100 p-4 lg:p-0 rounded block lg:group-[.active]:text-primary group-[.active]:bg-primary group-[.active]:text-slate-100 lg:hover:bg-transparent lg:group-[.active]:bg-transparent pb-1'>
                                        {nav.name}
                                    </a>
                                    <p className='duration-500 group-hover:w-full w-0 h-0.5 bg-primary group-[.active]:w-full'></p>
                                </li>
                            ))}
                        </ul>
                    </nav>
                    <div class='min-w-60 flex items-center justify-end gap-4'>
                        <a
                            target='_blank'
                            class='font-semibold bg-primary/80 text-slate-100 px-4 py-2 text-sm sm:text-[17px] sm:px-7 sm:py-4 uppercase rounded duration-500 hover:bg-primary hover:tracking-[0.01em] flex gap-2 items-center justify-center'
                            href='null'>
                            <span class='flex gap-2'>Contact With US</span>
                            <span>
                                <i
                                    class='fa-solid fa-arrow-right'
                                    aria-hidden='true'></i>
                            </span>
                        </a>
                        <div class='block lg:hidden'>
                            {isMobileMenu.value ? (
                                <button
                                    onClick={toggleButton}
                                    class='block font-semibold bg-primary/80 text-slate-100 px-3 py-1 text-lg sm:text-[17px] sm:px-5 sm:py-2.5 sm:text-2xl uppercase rounded duration-500 hover:bg-primary hover:tracking-[0.01em]'>
                                    <i
                                        class='fa-solid fa-bars'
                                        aria-hidden='true'></i>
                                </button>
                            ) : (
                                <button
                                    onClick={toggleButton}
                                    class='block font-semibold bg-red-500 text-slate-100 px-3 py-1 text-lg sm:text-[17px] sm:px-5 sm:py-2.5 sm:text-2xl uppercase rounded duration-500 hover:bg-red-600 hover:tracking-[0.01em]'>
                                    <i class='fa-solid fa-xmark'></i>
                                </button>
                            )}
                        </div>
                    </div>
                </header>
            </div>
        );
    },
});
