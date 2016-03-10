package com.autoparts.test;

import java.text.DecimalFormat;

public class test {
	public static void main(String[] args) {
		
		String str = "a";
		String str1 = "a";
		if(str==str1){
			System.out.println("a");	
		}
		
		
		DecimalFormat df = new DecimalFormat();
        df.setDecimalSeparatorAlwaysShown(false);
		double a = 3000;
		System.out.println(df.format(a));
		
		
		/*
		String str = " a	s	\t	f	\n	s	";
		String test = "abc		123 ABC";
		str=str.trim();
		for(String s : test.split("\t")){
			System.out.println(s);
		}
		//System.out.println(test.length());
		String cut;
		ArrayList<String> a = new ArrayList<>();
		ArrayList<String> b = new ArrayList<>();
		ArrayList<String> c = new ArrayList<>();
		StringTokenizer st;
		for(int i=0; i<str.length(); i=i+3){
			
			st = new StringTokenizer(str);
			
			cut=str.substring(i,i+1);
			
			if(cut.equals("	")){
				
				System.out.println(cut+"cut");
				
			}else{
				System.out.println(cut);
			}
			
			if(i%3==0){
				a.add(cut);
			}else if(i%3==1){
				b.add(cut);
			}else if(i%3==2){
				c.add(cut);
			}
		}
		
		*/
		
		
/*		str=str.trim();
		StringTokenizer st = new StringTokenizer(str);

		while(st.hasMoreElements()){
			System.out.println(st.nextToken());
		}
*/				
	}
}
