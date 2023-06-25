const app = Vue.createApp({
  data() {
    return {
      products: [
        { name: 'product1', price: 1000, image: './assets/image1.jpg', isCart: false },
        { name: 'product2', price: 1200, image: './assets/image1.jpg', isCart: false },
        { name: 'product3', price: 1500, image: './assets/image1.jpg', isCart: false },
        { name: 'product4', price: 900, image: './assets/image1.jpg', isCart: true },
      ],
    };
  },
  methods: {
    onToggle(e, product) {
      product.isCart = !product.isCart;
    },
  },
  computed: {
    productsComputed() {
      return this.products.filter((product) => product.price < 1200);
    },
  },
});
app.mount('#contact');
