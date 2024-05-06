interface OrderItem {
    id: string;
    quantity: number;
    unitPrice: number;
    offer: {
        name: string;
    }

}

export interface Order {
    id: string;
    total: number;
    isFetched: boolean;
    createdAt: string;
    customerName: string;
    email: string;
    orderItems: OrderItem[];
}
