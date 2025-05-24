unsigned char stepseq[8] = {0x02,0x06,0x04,0x0C,0x08,0x09,0x01,0x03};
int i;
void main() 
{
P2 = 0x00;
while(1)
{
        for(i=0;i<8;i++)
        {
             P2 = stepseq[i];
             delay_ms(300);
        }
}
}

