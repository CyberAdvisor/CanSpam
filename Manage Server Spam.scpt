FasdUAS 1.101.10   ��   ��    k             l     ��  ��    %  Manage Server Spam application     � 	 	 >   M a n a g e   S e r v e r   S p a m   a p p l i c a t i o n   
  
 l     ��  ��    B < Save as Application in script editor to Applications folder     �   x   S a v e   a s   A p p l i c a t i o n   i n   s c r i p t   e d i t o r   t o   A p p l i c a t i o n s   f o l d e r      l     ��  ��    D > Customize to delete problematic spam that rules won't address     �   |   C u s t o m i z e   t o   d e l e t e   p r o b l e m a t i c   s p a m   t h a t   r u l e s   w o n ' t   a d d r e s s      l     ��  ��    1 + 12/30/22 - Michael Lines - Initial version     �   V   1 2 / 3 0 / 2 2   -   M i c h a e l   L i n e s   -   I n i t i a l   v e r s i o n      l     ��������  ��  ��        i         I     ������
�� .miscidlenmbr    ��� null��  ��    k           !   l     �� " #��   " W Q This is executed periodically when the script is run as a stay-open application.    # � $ $ �   T h i s   i s   e x e c u t e d   p e r i o d i c a l l y   w h e n   t h e   s c r i p t   i s   r u n   a s   a   s t a y - o p e n   a p p l i c a t i o n . !  % & % n     ' ( ' I    �������� 0 
deletespam 
deleteSpam��  ��   (  f      &  )�� ) l    * + , * L     - - m    ���� < +   Run every minute     , � . . $   R u n   e v e r y   m i n u t e  ��     / 0 / l     ��������  ��  ��   0  1�� 1 i     2 3 2 I      �������� 0 
deletespam 
deleteSpam��  ��   3 O     o 4 5 4 k    n 6 6  7 8 7 l   	 9 : ; 9 I   	������
�� .emalchmanull��� ��� null��  ��   :   Refresh/sync mail    ; � < < $   R e f r e s h / s y n c   m a i l 8  = > = l  
 
��������  ��  ��   >  ? @ ? l  
 
��������  ��  ��   @  A B A l  
 
�� C D��   C %  Loop through all junk messages    D � E E >   L o o p   t h r o u g h   a l l   j u n k   m e s s a g e s B  F G F l  
 
��������  ��  ��   G  H I H r   
  J K J n   
  L M L 2    ��
�� 
mssg M 1   
 ��
�� 
jkmb K o      ���� 0 
myjunklist 
myJunkList I  N�� N X    n O�� P O k   " i Q Q  R S R l  " "��������  ��  ��   S  T U T l  " "��������  ��  ��   U  V W V l  " "�� X Y��   X , & Mark all junk messages as read & junk    Y � Z Z L   M a r k   a l l   j u n k   m e s s a g e s   a s   r e a d   &   j u n k W  [ \ [ l  " "��������  ��  ��   \  ] ^ ] r   " ' _ ` _ m   " #��
�� boovtrue ` n      a b a 1   $ &��
�� 
isrd b o   # $���� 0 junkmsg junkMsg ^  c d c l  ( - e f g e r   ( - h i h m   ( )��
�� boovtrue i n      j k j 1   * ,��
�� 
isjk k o   ) *���� 0 junkmsg junkMsg f #  mark junk to protect privacy    g � l l :   m a r k   j u n k   t o   p r o t e c t   p r i v a c y d  m n m l  . .��������  ��  ��   n  o p o l  . .��������  ��  ��   p  q r q l  . .�� s t��   s   Delete known junk mail     t � u u 0   D e l e t e   k n o w n   j u n k   m a i l   r  v w v l  . .��������  ��  ��   w  x y x Z   . E z {���� z E   . 3 | } | n  . 1 ~  ~ 1   / 1��
�� 
sndr  o   . /���� 0 junkmsg junkMsg } m   1 2 � � � � �  r e g . r u { k   6 A � �  � � � l  6 ; � � � � r   6 ; � � � m   6 7��
�� qqclccre � n      � � � 1   8 :��
�� 
mcol � o   7 8���� 0 junkmsg junkMsg � - ' To make them easy to spot and not open    � � � � N   T o   m a k e   t h e m   e a s y   t o   s p o t   a n d   n o t   o p e n �  ��� � I  < A�� ���
�� .coredelonull���     obj  � o   < =���� 0 junkmsg junkMsg��  ��  ��  ��   y  � � � l  F F��������  ��  ��   �  � � � l  F F��������  ��  ��   �  � � � l  F F�� � ���   � M G Move all remaining server caught spam messages to separate junk folder    � � � � �   M o v e   a l l   r e m a i n i n g   s e r v e r   c a u g h t   s p a m   m e s s a g e s   t o   s e p a r a t e   j u n k   f o l d e r �  � � � l  F F�� � ���   �       � � � �    �  ��� � Z   F i � ����� � E   F K � � � n  F I � � � 1   G I��
�� 
raso � o   F G���� 0 junkmsg junkMsg � m   I J � � � � � 4 X - A p p l e - M o v e t o f o l d e r :   J u n k � I  N e�� � �
�� .coremovenull���     obj  � o   N O���� 0 junkmsg junkMsg � �� ���
�� 
insh � n   R a � � � 4   Z a�� �
�� 
mbxp � m   ] ` � � � � �   J u n k / S e r v e r _ S p a m � 4   R Z�� �
�� 
mact � m   V Y � � � � �  i C l o u d��  ��  ��  ��  �� 0 junkmsg junkMsg P o    ���� 0 
myjunklist 
myJunkList��   5 m      � ��                                                                                  emal  alis    (  Macintosh HD                   BD ����Mail.app                                                       ����            ����  
 cu             Applications  /:System:Applications:Mail.app/     M a i l . a p p    M a c i n t o s h   H D  System/Applications/Mail.app  / ��  ��       �� � � ���   � ����
�� .miscidlenmbr    ��� null�� 0 
deletespam 
deleteSpam � �� ���� � ���
�� .miscidlenmbr    ��� null��  ��   �   � ������ 0 
deletespam 
deleteSpam�� <�� 	)j+  O� � �� 3���� � ����� 0 
deletespam 
deleteSpam��  ��   � ������ 0 
myjunklist 
myJunkList�� 0 junkmsg junkMsg �  ������������������� ��������� ���� ��~ ��}
�� .emalchmanull��� ��� null
�� 
jkmb
�� 
mssg
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
isrd
�� 
isjk
�� 
sndr
�� qqclccre
�� 
mcol
�� .coredelonull���     obj 
�� 
raso
�� 
insh
� 
mact
�~ 
mbxp
�} .coremovenull���     obj �� p� l*j O*�,�-E�O [�[��l kh e��,FOe��,FO��,� ��,FO�j Y hO��,� �a *a a /a a /l Y h[OY��Uascr  ��ޭ